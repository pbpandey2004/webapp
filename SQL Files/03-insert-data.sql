LOCK TABLES `APP_USER` WRITE, `USER_PROFILE` WRITE, `APP_USER_USER_PROFILE` WRITE, `PERSISTENT_LOGINS` WRITE, `COMPETENCIES` WRITE, `APP_USER_COMPETENCY` WRITE;

INSERT INTO USER_PROFILE(type) VALUES ('USER'),('ADMIN'),('DBA');

INSERT INTO COMPETENCIES (description) VALUES ('Cloud Solution Architect'),('Business Analyst'),('Entreprise Architect'),('Data Scientist'),('Quality Assurance');

INSERT INTO APP_USER(sso_id, password, first_name, last_name, email) VALUES ('pandey','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'prashant','pandey','pbpandey@uw.edu');

INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id) VALUES (1,2);

UNLOCK TABLES;