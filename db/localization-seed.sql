BEGIN;

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'c4097cec-0369-4b2f-9599-c138c918bbe9', 'pg', 'en_IN', 'rainmaker-pg', 'APPLICATION_UPLOAD__AADHAAR_DETAILS', 'Aadhaar Details', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'APPLICATION_UPLOAD__AADHAAR_DETAILS'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'df5b0627-0ff2-4f7e-ade4-d454a7d9cfd0', 'pg', 'en_IN', 'rainmaker-pg', 'APPLICATION_UPLOAD__CAST_CERTIFICATE', 'Cast Certificate', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'APPLICATION_UPLOAD__CAST_CERTIFICATE'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '7ea4fa9b-53da-4a98-8462-a95ba1ac1ae4', 'pg', 'en_IN', 'rainmaker-pg', 'APPLICATION_UPLOAD__INCOME_CERTIFICATE', 'Income Certificate', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'APPLICATION_UPLOAD__INCOME_CERTIFICATE'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '9f5b06a8-9e95-4766-b1ad-637598b41a47', 'pg', 'en_IN', 'rainmaker-pg', 'DATEAPPLICATION_UPLOAD__AADHAAR_DETAILS', 'Aadhaar Details', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'DATEAPPLICATION_UPLOAD__AADHAAR_DETAILS'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '3b241a23-f09b-4aca-b417-304082b548b2', 'pg', 'en_IN', 'rainmaker-pg', 'DOCUMENT_UPLOAD', 'Upload Documents', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'DOCUMENT_UPLOAD'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'd42b7635-d9af-4ca3-b18c-e1b9a71a590d', 'pg', 'en_IN', 'rainmaker-pg', 'DSS_PROPERTY_TAX', 'Property Tax', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'DSS_PROPERTY_TAX'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '77048186-424e-475d-89b9-cdbc2331a401', 'pg', 'en_IN', 'rainmaker-pg', 'PG_ADDISABABA_ADMIN_ADD01', 'Sabiyan', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_ADDISABABA_ADMIN_ADD01'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'fabe676c-650a-458b-9510-f84522824e68', 'pg', 'en_IN', 'rainmaker-pg', 'PG_ADDISABABA_ADMIN_ADD02', 'Melka Jebdu', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_ADDISABABA_ADMIN_ADD02'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'efa39f0c-b265-4e42-897a-a0caa8e666a4', 'pg', 'en_IN', 'rainmaker-pg', 'PG_AMHARA_ADMIN_AMR01', 'Adama', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_AMHARA_ADMIN_AMR01'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '042e2a29-605e-4bd2-a00d-18fcc9af817a', 'pg', 'en_IN', 'rainmaker-pg', 'PG_AMHARA_ADMIN_AMR02', 'Piasa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_AMHARA_ADMIN_AMR02'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'db25cf06-2149-4560-a36a-186c4841865f', 'pg', 'en_IN', 'rainmaker-pg', 'PG_DIRADAWA_ADMIN_DRD01', 'Bahar Dar', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_DIRADAWA_ADMIN_DRD01'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '5f318347-d00b-4a86-8abe-018981951ebd', 'pg', 'en_IN', 'rainmaker-pg', 'PG_DIRADAWA_ADMIN_DRD02', 'Gonder', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_DIRADAWA_ADMIN_DRD02'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'c6323ed1-8826-44dd-9806-d4516dff5b01', 'pg', 'en_IN', 'rainmaker-pg', 'PG_OROMIA_ADMIN_OR01', 'Nefas Silk Subcity', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_OROMIA_ADMIN_OR01'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '7a15ff55-2293-4140-9932-d0458bc06b54', 'pg', 'en_IN', 'rainmaker-pg', 'PG_OROMIA_ADMIN_OR02', 'Lemi Kura Subcity', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_OROMIA_ADMIN_OR02'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '25288076-526e-42e9-93c6-dcb27d97b6df', 'pg', 'en_IN', 'rainmaker-pg', 'PG_OROMIA_ADMIN_OR03', 'Piasa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'PG_OROMIA_ADMIN_OR03'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '51fdd830-77f6-4900-8a99-a07d93349878', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_ADDISABABA', 'Addis Ababa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_ADDISABABA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '46441747-caf7-44aa-b1eb-d320e905865f', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_ADDIS_ABABA', 'Addis Ababa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_ADDIS_ABABA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'f8a03a32-985a-43cb-8a48-c77bef6628d1', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_AMHARA', 'Ethopia', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_AMHARA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'c56be08e-e540-4aba-b029-ec5fbc369086', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_CITYA_PDF_HEADER', 'City A Municipalty', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_CITYA_PDF_HEADER'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '9da7be2d-6056-4699-acaf-2528eab94efa', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_CITYB', 'City B', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_CITYB'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'cdd474d1-ca61-4d24-9112-d727a24600a1', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_DIRADAWA', 'Dire Dawa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_DIRADAWA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '14543391-c4ea-472e-bd14-dc35685be74f', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_DIREDAWA', 'Dire Dawa', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_DIREDAWA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'c7f738b2-bf42-4623-89d4-07d1e4014492', 'pg', 'en_IN', 'rainmaker-pg', 'TENANT_TENANTS_PG_OROMIA', 'Oromia', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-pg' AND code = 'TENANT_TENANTS_PG_OROMIA'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '5d0a8cf4-c448-4dc4-b933-6f495bdd9754', 'pg', 'en_IN', 'rainmaker-hrms', 'CORE_NO', 'No', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-hrms' AND code = 'CORE_NO'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '26dfdb54-07b8-419c-bd84-f98399e24a7e', 'pg', 'en_IN', 'rainmaker-hrms', 'CORE_YES', 'Yes', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-hrms' AND code = 'CORE_YES'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'f863e72e-c8d9-45ab-8987-60efbd5208d5', 'pg', 'en_IN', 'rainmaker-hrms', 'Pt-test', 'testingss', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'rainmaker-hrms' AND code = 'Pt-test'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '93951e7f-9373-43a2-9418-a98638ce3b22', 'pg', 'en_IN', 'egov-hrms', 'hrms.employee.create.notification', 'Hi $employeename, Welcome to mSeva. Your profile has been successfully set-up : Username - $username Password - $password Visit your profile at $applink, Thank you.', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-hrms' AND code = 'hrms.employee.create.notification'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '94b04d68-96b1-4cf5-a0db-0f3193dc2939', 'pg', 'en_IN', 'egov-hrms', 'hrms.employee.reactivation.notification', 'Dear {Employee Name},
Your profile with employee Username {Username} has been activated on {date}. Your one-time password is {password}. Please change your password using the link below
{link}

EGOVS', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-hrms' AND code = 'hrms.employee.reactivation.notification'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'c72323a1-1c2e-407f-a699-444c1c08b95a', 'pg', 'en_IN', 'egov-user', 'ADMIN_MO', 'City G', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-user' AND code = 'ADMIN_MO'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '0c12cef4-f4c5-409c-9366-094e0a8f4abd', 'pg', 'en_IN', 'egov-user', 'EMAIL_UPDATED', 'Dear Citizen, your e-mail has been updated from {oldEmail} to {newEmail}.

EGOVS''', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-user' AND code = 'EMAIL_UPDATED'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'a8186c1f-bd67-4eb3-b609-23a23e4273dd', 'pg', 'en_IN', 'egov-user', 'sms.login.otp.msg', 'Dear Citizen, Your Login OTP is %s.

EGOVS', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-user' AND code = 'sms.login.otp.msg'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT '1cfc101c-4bed-47bd-bbd5-752d8e8d996c', 'pg', 'en_IN', 'egov-user', 'sms.pwd.reset.otp.msg', 'Dear Citizen, Your OTP for recovering password is %s.

EGOVS', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-user' AND code = 'sms.pwd.reset.otp.msg'
);

INSERT INTO message (id, tenantid, locale, module, code, message, createdby, createddate, lastmodifiedby, lastmodifieddate)
SELECT 'eda58665-7601-4926-9e7b-cd7127a851f9', 'pg', 'en_IN', 'egov-user', 'sms.register.otp.msg', 'Dear Citizen, Your OTP to complete your mSeva Registration is %s.

EGOVS', 1, now(), 1, now()
WHERE NOT EXISTS (
  SELECT 1 FROM message WHERE tenantid = 'pg' AND locale = 'en_IN' AND module = 'egov-user' AND code = 'sms.register.otp.msg'
);

COMMIT;
