// Pass/fail thresholds for all scenarios
// Scoped to 'main' scenario to exclude warmup data

export const THRESHOLDS = {
  'transaction_duration{scenario:main}': ['p(95)<10000', 'p(99)<20000'],
  'transaction_success{scenario:main}': ['rate>0.95'],
  'http_req_failed{scenario:main}': ['rate<0.01'],
};
