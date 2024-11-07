----------------------------------------------------------------------------------
--                           Run script in OLAP database
-- (Script create table olapts.panegf_report)
----------------------------------------------------------------------------------

--------------------------------------------------------------
--                Table: olapts.panegf_report
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.panegf_view;
DROP TABLE IF EXISTS olapts.panegf_report;

CREATE TABLE olapts.panegf_report
(
    cdi text COLLATE pg_catalog."default",
    afm text COLLATE pg_catalog."default",
    grade character varying COLLATE pg_catalog."default",
    approveddate character varying(30) COLLATE pg_catalog."default",
    nextreviewdate text COLLATE pg_catalog."default",
    ratingmodelname text COLLATE pg_catalog."default",
    fiscalyear text COLLATE pg_catalog."default",
    salesrevenues text COLLATE pg_catalog."default",
    totalassets text COLLATE pg_catalog."default",
    entityid text COLLATE pg_catalog."default",
    overrideflag text COLLATE pg_catalog."default",
    creditcommitteedate text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;

ALTER TABLE olapts.panegf_report OWNER to olap;

-----------------------------------
--Check if the tables were created
----------------------------------

--select * from olapts.panegf_report

