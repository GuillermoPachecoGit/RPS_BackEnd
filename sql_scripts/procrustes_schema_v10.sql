 CREATE DOMAIN email AS text
 CHECK( 
 	VALUE  ~* '^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$'
 );
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
-- TABLE: APP_USER 
--

CREATE TABLE APP_USER(
    user_id       serial            NOT NULL,
    password         varchar(50)     NOT NULL,
    area             varchar(80),
    first_name       varchar(80)     NOT NULL,
    email_address    email    NOT NULL,
    institution      varchar(80),
    country_id       int8            NOT NULL,
    last_name       varchar(80),
    nick            varchar(80)      NOT NULL,
    CONSTRAINT PK_APP_USER PRIMARY KEY (user_id),
    CONSTRAINT AK_APP_USER  UNIQUE (email_address)
)
;

-- 
-- TABLE: PROJECT 
--




-- 
-- TABLE: USER 
--

ALTER TABLE APP_USER ADD CONSTRAINT FK_APP_USER_COUNTRY 
    FOREIGN KEY (country_id)
    REFERENCES COUNTRY(country_id)
    ON DELETE CASCADE
;


CREATE TABLE PROJECT(
    project_id       serial           NOT NULL,
    description      text,
    creation_date    timestamp      NOT NULL,
    project_name     varchar(80)    NOT NULL,
    user_id       int8           NOT NULL,
    CONSTRAINT PK_PROJECT PRIMARY KEY (project_id)
);

--new remove cascade reference
ALTER TABLE PROJECT ADD CONSTRAINT FK_PROJECT_APP_USER 
    FOREIGN KEY (user_id)
    REFERENCES APP_USER(user_id)
;

--
--  TABLE: dataset
--
CREATE  TABLE dataset (
 dataset_id serial NOT NULL,
 project_id_ref int8  NOT NULL, 
 dataset_name   varchar(80)  NOT NULL,
 file_name   varchar(256)  NOT NULL,
 number_of_objects    int4  NOT NULL,
 number_of_landmarks    int4  NOT NULL,
 dimention              int4  NOT NULL,
 data json NOT NULL,
 colors json NOT NULL, --para editar colores
 objects_name json NOT NULL,
 dataset_id_ref int8 NULL,
 show_consensus int8 NOT NULL,
 send int8 NOT NULL,
 pdf json,
 CONSTRAINT pk_dataset_json PRIMARY KEY (dataset_id)
);

ALTER TABLE dataset ADD CONSTRAINT FK_dataset_json_project
FOREIGN KEY (project_id_ref)
REFERENCES project(project_id)
ON DELETE CASCADE;

ALTER TABLE dataset ADD CONSTRAINT FK_dataset_json_dataset
FOREIGN KEY (dataset_id_ref)
REFERENCES dataset(dataset_id)
ON DELETE CASCADE;  
-- 
-- DROP TABLE dataset

 
-- 
-- TABLE: DISTANCE 
--

CREATE TABLE DISTANCE(
    distance_id serial NOT NULL,
    dataset_id_ref int8 NOT NULL,
    distance_name varchar(80) NOT NULL,
    data json NOT NULL,
    objects_name json NOT NULL,
    dimention int8 NOT NULL,
    send int NOT NULL,
    pdf json,
    CONSTRAINT PK_DISTANCE PRIMARY KEY (distance_id)
)
;

ALTER TABLE DISTANCE ADD CONSTRAINT FK_DISTANCE_DATASET
    FOREIGN KEY (dataset_id_ref)
    REFERENCES dataset(dataset_id)
    ON DELETE CASCADE
;

CREATE TABLE ORDINATION(
    ordination_id serial NOT NULL,
    dataset_id_ref int8 NOT NULL,
    distance_id_ref int8 NOT NULL,
    ordination_name varchar(80) NOT NULL,
    data json NOT NULL,
    objects_name json NOT NULL,
    colors json NOT NULL,
    send int8 NOT NULL,
    pdf json,
    CONSTRAINT PK_ordination PRIMARY KEY (ordination_id)
)
;

ALTER TABLE ORDINATION ADD CONSTRAINT FK_ORDINATION_DATASET
    FOREIGN KEY (dataset_id_ref)
    REFERENCES dataset(dataset_id)
    ON DELETE CASCADE
;

ALTER TABLE ORDINATION ADD CONSTRAINT FK_ORDINATION_DISTANCE
    FOREIGN KEY (distance_id_ref)
    REFERENCES distance(distance_id)
    ON DELETE CASCADE
;
