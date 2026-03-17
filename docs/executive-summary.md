# Executive Summary

A single-machine DIGIT deployment can handle **544,000 complaint transactions per day** at 1 million records — **54x the 10,000/day target**. We found and fixed 3 critical database performance bugs along the way.

## Key Numbers

| | Value |
|-|-------|
| Daily capacity at 1M records | **544,320 txn/day** |
| Peak throughput (empty DB) | 37 lifecycles/sec |
| Throughput at 1M records | 6.3 lifecycles/sec |
| Max concurrent users (16 vCPU) | ~300 |
| Max concurrent users (8 vCPU) | ~250 |
| Database bugs found | 3 critical |
| Throughput recovery after fixes | **9.4x** |
| Records tested at | 1,006,743 complaints |

## What We Tested

Every test iteration runs one complete PGR complaint lifecycle — **4 API calls** through the full stack:

**CREATE** (file complaint) → **ASSIGN** (route to department) → **RESOLVE** (close it) → **SEARCH** (verify status)

This exercises Kong, PGR Services, Workflow, Persister, Kafka, and Postgres — the entire hot path.

## What We Found

As the database grew past 100K records, throughput dropped **5.2x** (from 27/s to 5/s). Root cause analysis revealed 3 bugs:

### Bug 1: Missing Database Index (200x improvement)

The PGR address table has a foreign key but no index on it. Every complaint lookup scans the entire table. One `CREATE INDEX` statement fixes it.

### Bug 2: Wrong Query Operator in Workflow (769x improvement potential)

The workflow service uses `LIKE '%businessId%'` instead of `= businessId` for exact-match lookups. This forces sequential table scans instead of index lookups. A GIN trigram index provides a **32x** workaround, but the proper fix — changing `LIKE` to `=` in the Java code — would yield **769x** improvement.

::: warning Recommended Upstream Fix
Change `LIKE ANY(ARRAY[...])` to `= ANY(ARRAY[...])` in `egov-workflow-v2` → `WorkflowRepository.java`. BusinessIds are exact values, not patterns.
:::

### Bug 3: JIT Compilation Overhead (4.3x improvement)

Postgres JIT compilation hurts simple OLTP queries — spending 324ms compiling for a 90ms query. Disabling JIT (`ALTER SYSTEM SET jit = off`) gives an immediate 4.3x boost.

## Before and After

All three fixes combined, at 100K records:

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Throughput | 3.96/s | 37.09/s | **9.4x** |
| Avg latency | 4,090ms | 433ms | **9.4x** |
| p95 latency | 5,620ms | 558ms | **10.1x** |

## Capacity at Scale

With fixes applied, throughput degrades gracefully as records grow:

| Records | Throughput | Daily Capacity |
|---------|------------|---------------|
| 0 - 100K | 37/s | 3.2M/day |
| 300K | 22/s | 1.9M/day |
| 500K | 14/s | 1.2M/day |
| **1M** | **6.3/s** | **544K/day** |

Even at 1M records, capacity is **54x** the 10K/day target. The remaining degradation is driven by the workflow `LIKE` query (Bug 2) — fixing it upstream would flatten this curve.

## What To Do

### For Platform Teams (apply now)

Run these SQL statements on any DIGIT Postgres instance:

```sql
-- Fix Bug 1: missing FK index
CREATE INDEX idx_eg_pgr_address_v2_parentid ON eg_pgr_address_v2 (parentid);

-- Fix Bug 2: GIN trigram workaround for LIKE ANY
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_wf_pi_bizid_trgm
  ON eg_wf_processinstance_v2 USING gin (businessid gin_trgm_ops);

-- Supporting indexes for workflow queries
CREATE INDEX idx_eg_wf_pi_v2_tenant_bsvc
  ON eg_wf_processinstance_v2 (tenantid, businessservice, lastmodifiedtime DESC);
CREATE INDEX idx_wf_pi_tenant_bizid_time
  ON eg_wf_processinstance_v2 (tenantid, businessid, lastmodifiedtime DESC);

-- Fix Bug 3: disable JIT
ALTER SYSTEM SET jit = off;
SELECT pg_reload_conf();
```

See [Detailed Findings](./findings) for full EXPLAIN plans and analysis.

### For DIGIT Core Team (upstream fix)

File a PR to change `egov-workflow-v2` → `WorkflowRepository.java`:
- Replace `LIKE ANY(ARRAY[...])` with `= ANY(ARRAY[...])`
- Remove the `%...%` wrapping of businessId parameters

This eliminates the need for the GIN trigram index and would deliver 769x improvement on the hottest query path.

### For Developers (reproduce and extend)

See the [Architecture](./architecture), [Setup](./setup), and [Running Tests](./running-tests) guides to run these tests yourself or add new scenarios.

## Test Infrastructure

| Machine | Specs | Role |
|---------|-------|------|
| Dev | 8 vCPU, 16 GB RAM | Baseline testing |
| Prod | 16 vCPU, 32 GB RAM | Scale testing, 1M seeding |

Both run the full DIGIT Docker Compose stack (~30 containers). Tests are driven by [k6](https://k6.io/) from a separate control machine.
