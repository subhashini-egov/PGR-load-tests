# DIGIT Load Tests

k6-based load testing for the DIGIT Docker Compose stack.

## Quick Start

1. Install k6: https://grafana.com/docs/k6/latest/set-up/install-k6/
2. Copy config: `cp k6/config/environments.js.example k6/config/environments.js`
3. Edit `k6/config/environments.js` with target machine IPs
4. Run a single test:

```bash
./scripts/run-test.sh dev cpu-2 ramp-2vu
```

5. Run full matrix:

```bash
./scripts/run-matrix.sh
```

## Structure

- `k6/` — k6 test scripts and helpers
- `profiles/` — Docker Compose CPU limit overrides
- `ansible/` — Machine provisioning playbooks
- `scripts/` — Test runners and result collection
- `results/` — Test output (gitignored)

## Design

See `docs/superpowers/specs/2026-03-15-digit-load-testing-design.md`
