
drop table ordination


CREATE TABLE ORDINATION(
    ordination_id serial NOT NULL,
    dataset_id_ref int8 NOT NULL,
    project_id_ref int8 NOT NULL,
    distance_id_ref int8 NOT NULL,
    ordination_name varchar(70) NOT NULL,
    data json NOT NULL,
    specimen_name json NOT NULL,
    CONSTRAINT PK_ordination PRIMARY KEY (ordination_id,dataset_id_ref)
)
;


ALTER TABLE ORDINATION ADD CONSTRAINT FK_ORDINATION_DATASET
    FOREIGN KEY (dataset_id_ref,project_id_ref)
    REFERENCES dataset_json(dataset_id,project_id)
;

ALTER TABLE ORDINATION ADD CONSTRAINT FK_ORDINATION_DISTANCE
    FOREIGN KEY (distance_id_ref)
    REFERENCES distance(distance_id)
;

select *
from ordination

