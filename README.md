# DIGIT Load Tests

k6-based load testing for the DIGIT PGR (Public Grievance Redressal) service running on a Docker Compose stack.

This repo was used to evaluate whether a single-machine DIGIT deployment can sustain 10,000+ complaint transactions per day. The answer: **yes, comfortably** — even at 1M records, the system handles 544K txn/day after database optimizations. Along the way, 3 critical database performance bugs were discovered and fixed.

## Key Results

| Metric | Value |
|--------|-------|
| VU ceiling (8 vCPU machine) | ~250 concurrent users |
| VU ceiling (16 vCPU machine) | ~300 concurrent users |
| Peak throughput (empty DB) | 37 lifecycles/sec |
| Throughput at 1M records | 6.3 lifecycles/sec |
| Daily capacity at 1M records | **544,320 txn/day** |
| Database bugs found | 3 (missing FK index, `LIKE ANY` instead of `= ANY`, JIT overhead) |
| Throughput recovery after fixes | **9.4x** |

## Repository Structure

```
digit-load-tests/
├── k6/
│   ├── config/
│   │   ├── environments.js.example  # Target machine IPs and credentials
│   │   └── thresholds.js            # Pass/fail thresholds
│   ├── helpers/
│   │   ├── auth.js                  # OAuth login and token management
│   │   └── pgr.js                   # PGR API helpers (create, update, search)
│   └── scenarios/
│       ├── smoke.js                 # 1 VU, 1 iteration — validation
│       ├── ramp-2vu.js              # Warmup + ramp to 2 VUs
│       ├── ramp-10vu.js             # Warmup + ramp to 10 VUs
│       ├── ramp-50vu.js             # Warmup + ramp to 50 VUs
│       ├── burst.js                 # Constant VUs for ceiling testing
│       ├── seed-1m.js               # 540K iterations for DB population
│       ├── seed-calibrate.js        # 1K iterations for quick throughput check
│       └── pgr-lifecycle.js         # Shared lifecycle logic (CREATE→ASSIGN→RESOLVE→SEARCH)
├── profiles/                        # Docker Compose CPU limit overrides
│   ├── cpu-2.yml                    # 2 vCPU budget across all services
│   ├── cpu-4.yml
│   ├── cpu-8.yml
│   └── cpu-16.yml
├── ansible/                         # Machine provisioning
│   ├── inventory.ini                # Target machine IPs
│   ├── playbook-setup.yml           # Full stack setup
│   └── playbook-profile.yml         # Apply CPU profiles remotely
├── scripts/
│   ├── run-test.sh                  # Run a single test
│   ├── run-matrix.sh                # Run full profile × scenario matrix
│   ├── collect-results.sh           # Generate results summary table
│   └── apply-cpu-profile.py         # Apply CPU limits via docker update
├── platform/                        # Git submodule → CCRS repo
├── results/                         # Test output (partially gitignored)
└── docs/                            # Documentation + Vite dashboard
```

## Quick Start

1. Install [k6](https://grafana.com/docs/k6/latest/set-up/install-k6/)

2. Clone with submodule:
   ```bash
   git clone --recurse-submodules https://github.com/<org>/digit-load-tests.git
   cd digit-load-tests
   ```

3. Configure target machines:
   ```bash
   cp k6/config/environments.js.example k6/config/environments.js
   # Edit environments.js with your machine IPs
   ```

4. Run a smoke test:
   ```bash
   ./scripts/run-test.sh dev baseline smoke
   ```

5. Run a real test:
   ```bash
   ./scripts/run-test.sh dev baseline ramp-2vu
   ```

See [docs/setup.md](docs/setup.md) for full setup instructions including machine provisioning, database preparation, and SSH tunnels.

## Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/architecture.md) | Test design, PGR lifecycle, scenario types, CPU profiling approach |
| [Setup](docs/setup.md) | Machine provisioning, k6 configuration, database indexes, SSH tunnels |
| [Running Tests](docs/running-tests.md) | How to run each scenario, interpret results, troubleshoot failures |
| [Findings](docs/findings.md) | Performance results, database bugs, SQL fixes, capacity planning |

## Test Scenarios

| Scenario | VUs | Duration | Purpose |
|----------|-----|----------|---------|
| `smoke` | 1 | ~30s | Validate test scripts work |
| `ramp-2vu` | 2 | 10 min | Baseline steady-state measurement |
| `ramp-10vu` | 10 | 10 min | Moderate load measurement |
| `ramp-50vu` | 50 | 12 min | Heavy load / stress testing |
| `burst` | configurable | configurable | Find VU ceiling |
| `seed-1m` | 50 | ~13 hours | Populate DB with 540K records |
| `seed-calibrate` | 50 | ~2 min | Quick throughput check |
