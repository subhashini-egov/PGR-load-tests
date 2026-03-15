import http from 'k6/http';
import { makeRequestInfo } from './auth.js';

const HEADERS = { 'Content-Type': 'application/json' };

/**
 * Check if response is a 401 auth error.
 */
export function isAuthError(res) {
  return res.status === 401;
}

/**
 * Create a PGR complaint.
 * @returns {object} The created service object or null
 */
export function createComplaint(baseUrl, token, userInfo, tenantId, serviceCode, citizenPhone, citizenName) {
  const requestInfo = makeRequestInfo(token, userInfo);
  const payload = {
    service: {
      tenantId: tenantId,
      serviceCode: serviceCode,
      description: `Load test complaint - ${serviceCode} - VU ${citizenName}`,
      additionalDetail: {},
      source: 'web',
      address: {
        landmark: 'Load Test Landmark',
        city: 'City A',
        district: 'City A',
        region: 'City A',
        pincode: '',
        locality: {
          code: 'JLC477',
          name: 'Gali No,. 2 To Gali No. 6',
        },
        geoLocation: {},
      },
      citizen: {
        name: citizenName,
        type: 'CITIZEN',
        mobileNumber: citizenPhone,
        roles: [
          {
            id: null,
            name: 'Citizen',
            code: 'CITIZEN',
            tenantId: tenantId,
          },
        ],
        tenantId: tenantId,
      },
    },
    workflow: { action: 'APPLY' },
    RequestInfo: requestInfo,
  };

  const res = http.post(
    `${baseUrl}/pgr-services/v2/request/_create?tenantId=${tenantId}`,
    JSON.stringify(payload),
    { headers: HEADERS, tags: { name: 'PGR_Create' } }
  );

  if (res.status !== 200) {
    console.error(`PGR Create failed: ${res.status} ${res.body}`);
    return null;
  }

  const body = res.json();
  return body.ServiceWrappers[0].service;
}

/**
 * Update a PGR complaint (Assign, Resolve, or Rate).
 * @param {string} action - ASSIGN, RESOLVE, or RATE
 * @param {object} service - The service object from create/previous update
 * @param {string[]} assignees - UUIDs of assignees (empty array for RATE)
 * @param {string} comment
 * @param {number} [rating] - Rating 1-5 (required for RATE action)
 * @returns {object} Updated service object
 */
export function updateComplaint(baseUrl, token, userInfo, service, action, assignees, comment, rating) {
  const requestInfo = makeRequestInfo(token, userInfo);
  const workflow = {
    action: action,
    assignes: assignees,
    comments: comment,
  };
  if (rating !== undefined) {
    workflow.rating = rating;
  }
  const payload = {
    workflow: workflow,
    service: service,
    RequestInfo: requestInfo,
  };

  const tagName = `PGR_${action.charAt(0) + action.slice(1).toLowerCase()}`;
  const res = http.post(
    `${baseUrl}/pgr-services/v2/request/_update`,
    JSON.stringify(payload),
    { headers: HEADERS, tags: { name: tagName } }
  );

  if (res.status !== 200) {
    console.error(`PGR ${action} failed: ${res.status} ${res.body}`);
    return null;
  }

  const body = res.json();
  return body.ServiceWrappers[0].service;
}

/**
 * Search for a PGR complaint by serviceRequestId.
 * @returns {object} The service object
 */
export function searchComplaint(baseUrl, token, userInfo, tenantId, serviceRequestId) {
  const requestInfo = makeRequestInfo(token, userInfo);
  const payload = { RequestInfo: requestInfo };

  const res = http.post(
    `${baseUrl}/pgr-services/v2/request/_search?tenantId=${tenantId}&serviceRequestId=${serviceRequestId}`,
    JSON.stringify(payload),
    { headers: HEADERS, tags: { name: 'PGR_Search' } }
  );

  if (res.status !== 200) {
    console.error(`PGR Search failed: ${res.status} ${res.body}`);
    return null;
  }

  const body = res.json();
  return body.ServiceWrappers[0].service;
}
