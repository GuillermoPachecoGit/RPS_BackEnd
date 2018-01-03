
-- DROP TABLE analysis cascade;
-- DROP TABLE specimen cascade; 
-- DROP TABLE project cascade;
-- DROP TABLE landmark cascade;
-- DROP TABLE country cascade;
--DROP TABLE app_user cascade;
-- DROP TABLE data_set cascade;
-- DROP TABLE color cascade
-- DROP TABLE distance cascade

-- 
-- CREATE OR REPLACE DOMAIN email AS text
-- CHECK( 
-- 	VALUE  ~* '^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$'
-- );
-- 
-- TABLE: COUNTRY 
--

CREATE TABLE COUNTRY(
    country_id      serial           NOT NULL,
    country_name    varchar(60)    NOT NULL,
    CONSTRAINT PK_COUNTRY PRIMARY KEY (country_id)
)
;

 
-- 
-- TABLE: SPECIMEN SPECIMEN 
--

CREATE TABLE DISTANCE(
    project_id         int8                NOT NULL,
    project_id_ref     int8                NOT NULL,
    dataset_id_ref     int8                NOT NULL,
    dataset_id         int8                NOT NULL,
    specimen_id        int8                NOT NULL,
    specimen_id_ref    int8                NOT NULL,
    distance           decimal(100, 99)    NOT NULL,
    CONSTRAINT PK_DISTANCE PRIMARY KEY (project_id, dataset_id, specimen_id, project_id_ref, dataset_id_ref, specimen_id_ref)
)
;



-- 
-- TABLE: APP_USER 
--

CREATE TABLE APP_USER(
    user_id       serial            NOT NULL,
    password         varchar(40)     NOT NULL,
    area             varchar(20),
    first_name       varchar(30)     NOT NULL,
    email_address    email    NOT NULL,
    institution      varchar(60),
    country_id       int8            NOT NULL,
    CONSTRAINT PK_APP_USER PRIMARY KEY (user_id),
    CONSTRAINT AK_APP_USER  UNIQUE (email_address)
)
;



-- 
-- TABLE: DATASET 
--

CREATE TABLE DATASET(
    project_id             int8            NOT NULL,
    dataset_id             serial            NOT NULL,
    dataset_name           varchar(30)     NOT NULL,
    archive_name           varchar(256)    NOT NULL,
    numbers_of_specimen    int4            NOT NULL,
    numbers_of_landmark    int4            NOT NULL,
    dimention              int4            NOT NULL,
    dataset_type           char(1)         NOT NULL,
    dataset_ref_project    int8            NULL,
    dataset_ref_data       int8            NULL,       
    CONSTRAINT PK_DATASET PRIMARY KEY (project_id, dataset_id)
)
;


-- 
-- TABLE: LANDMARK 
--

CREATE TABLE LANDMARK(
    landmark_id    serial               NOT NULL,
    landmark_value decimal(50, 49)[]    NOT NULL,
    project_id_ref int8 NOT NULL,
    dataset_id_ref int8 NOT NULL,
    specimen_id_ref int8 NOT NULL,
    CONSTRAINT PK_LANDMARK PRIMARY KEY (landmark_id)
)
;



-- 
-- TABLE: PROJECT 
--

CREATE TABLE PROJECT(
    project_id       serial           NOT NULL,
    description      text,
    creation_date    timestamp      NOT NULL,
    project_name     varchar(20)    NOT NULL,
    user_id       int8           NOT NULL,
    CONSTRAINT PK_PROJECT PRIMARY KEY (project_id)
);



-- 
-- TABLE: SPECIMEN 
--

CREATE TABLE SPECIMEN(
    specimen_id       serial           NOT NULL,
    specimen_name     varchar(60)    NOT NULL,
    specimen_color    char(6)        NOT NULL,
    CONSTRAINT PK_SPECIMEN PRIMARY KEY (specimen_id)
);

CREATE TABLE SPECIMEN_FOR_DATA(
    project_id_ref int8 NOT NULL,
    dataset_id_ref int8 NOT NULL,
    specimen_id_ref int8 NOT NULL,
    CONSTRAINT PK_SPECIMEN_FOR_DATA PRIMARY KEY (project_id_ref,dataset_id_ref, specimen_id_ref)
);



-------------------------------------------------------------------------------------------------------FOREIGN KEYS


ALTER TABLE LANDMARK ADD CONSTRAINT FK_LANDMARK_DATASET_SPECIMEN
FOREIGN KEY (project_id_ref,dataset_id_ref,specimen_id_ref)
REFERENCES SPECIMEN_FOR_DATA(project_id_ref,dataset_id_ref,specimen_id_ref)
;                                            

ALTER TABLE SPECIMEN_FOR_DATA ADD CONSTRAINT FK_SPECIMEN_FOR_DATA_SPECIMEN 
    FOREIGN KEY (specimen_id_ref)
    REFERENCES SPECIMEN(specimen_id)
; 

ALTER TABLE SPECIMEN_FOR_DATA ADD CONSTRAINT FK_SPECIMEN_FOR_DATA_DATASET 
    FOREIGN KEY (project_id_ref,dataset_id_ref)
    REFERENCES DATASET(project_id,dataset_id)
; 

ALTER TABLE DATASET ADD CONSTRAINT  FK_DATASET_DATASET
FOREIGN KEY (dataset_ref_project, dataset_ref_data)
REFERENCES DATASET(project_id,dataset_id)
;

ALTER TABLE DATASET ADD CONSTRAINT FK_DATASET_PROJECT 
    FOREIGN KEY (project_id)
    REFERENCES PROJECT(project_id)
;

-- 
-- TABLE: PROJECT 
--

ALTER TABLE PROJECT ADD CONSTRAINT FK_PROJECT_APP_USER 
    FOREIGN KEY (user_id)
    REFERENCES APP_USER(user_id)
;


-- 
-- TABLE: SPECIMEN SPECIMEN 
--

ALTER TABLE DISTANCE ADD CONSTRAINT FK_DISTANCE_SPECIMEN 
    FOREIGN KEY (project_id, dataset_id, specimen_id)
    REFERENCES SPECIMEN_FOR_DATA(project_id_ref, dataset_id_ref, specimen_id_ref)
;

ALTER TABLE DISTANCE ADD CONSTRAINT FK_DISTANCE_SPECIMEN_1 
    FOREIGN KEY (project_id_ref, dataset_id_ref, specimen_id_ref)
    REFERENCES SPECIMEN_FOR_DATA(project_id_ref, dataset_id_ref, specimen_id_ref)
;


-- 
-- TABLE: USER 
--

ALTER TABLE APP_USER ADD CONSTRAINT FK_APP_USER_COUNTRY 
    FOREIGN KEY (country_id)
    REFERENCES COUNTRY(country_id)
;



