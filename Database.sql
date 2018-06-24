/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);
   
/* USER_PROFILE table contains all possible roles */ 
create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
   
/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
  
/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
  
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
  
INSERT INTO USER_PROFILE(type)
VALUES ('DBA');
  
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email)
VALUES ('sam','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam','Smith','samy@xyz.com');
  
  
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id) 
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.sso_id='sam' and profile.type='ADMIN';
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);

/* COMPETENCIES table contains all possible skills */ 
create table COMPETENCIES(
   id BIGINT NOT NULL AUTO_INCREMENT,
   competency VARCHAR(30) NOT NULL,
   description VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

/* Populate COMPETENCIES Table */
INSERT INTO COMPETENCIES(competency,description)
VALUES ('CSA','Cloud Solution Architect');
  
INSERT INTO COMPETENCIES(competency,description)
VALUES ('BA','Business Analyst');
  
INSERT INTO COMPETENCIES(competency,description)
VALUES ('EA','Entreprise Architect');

INSERT INTO COMPETENCIES(competency,description)
VALUES ('DS','Data Scientist');

INSERT INTO COMPETENCIES(competency,description)
VALUES ('QA','Quality Assurance');


/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE APP_USER_COMPETENCY (
    user_id BIGINT NOT NULL,
    competencies_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, competencies_id),
    CONSTRAINT FK_APP_USER_COMP FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_COMPETENCIES FOREIGN KEY (competencies_id) REFERENCES COMPETENCIES (id)
);


/* Populate JOIN Table */
INSERT INTO APP_USER_COMPETENCY (user_id, competencies_id)
VALUES ('1','1');
INSERT INTO APP_USER_COMPETENCY (user_id, competencies_id)
VALUES ('1','2');

ALTER TABLE COMPETENCIES
ADD CONSTRAINT constraint_name UNIQUE (description);

ALTER TABLE COMPETENCIES
  DROP COLUMN competency;