------------------------------------------------------------------------------------------------
--
--                                  Run script in OLAP database
--
--(Script creates two tables olapts.esgreport and olapts.report_esgoverallassessment)
------------------------------------------------------------------------------------------------

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--                Table: olapts.esgreport
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.esgreport_view;
DROP TABLE IF EXISTS olapts.esgreport;

CREATE TABLE olapts.esgreport
(
    record_type smallint,
    as_of_dt text COLLATE pg_catalog."default",
    src_stm_code character(5) COLLATE pg_catalog."default",
    unq_asses_id character(40) COLLATE pg_catalog."default",
    inv_pty_rtg_ent_id character(10) COLLATE pg_catalog."default",
    inv_pty_rtg_oblg_tax_id character(20) COLLATE pg_catalog."default",
    inv_pty_rtg_oblg_cdi_code character(10) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_ev_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_stm_rtrvl_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_asses_dt character(8) COLLATE pg_catalog."default",
    inv_pty_aprv_rtg_aprv_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_cr_cmte_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_next_rvw_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_aprv_ahr_id character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_anl_nm character(50) COLLATE pg_catalog."default",
    inv_pty_rtg_ovrd_rsn_tp_id character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_aprv_nm character(50) COLLATE pg_catalog."default",
    inv_pty_rtg_bsn_prtf character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_ovrd_drvr character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_tp character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_envrnm_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_envrnm_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_scl_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_scl_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_gvrnc_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_gvrnc_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_tp_sctr character(100) COLLATE pg_catalog."default",
    quest_id character(50) COLLATE pg_catalog."default",
    quest_vrsn character(50) COLLATE pg_catalog."default",
    oblg_rgstrn_num character(50) COLLATE pg_catalog."default",
    jrsctn character(5) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;

ALTER TABLE olapts.esgreport OWNER to olap;

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--           Table: olapts.report_esgoverallassessment
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.report_esgoverallassessment_view;
DROP TABLE IF EXISTS olapts.report_esgoverallassessment;

CREATE TABLE olapts.report_esgoverallassessment
(
    assessmentdate text COLLATE pg_catalog."default",
    assessmentuser text COLLATE pg_catalog."default",
    taxid character varying COLLATE pg_catalog."default",
    cdi character varying COLLATE pg_catalog."default",
    issustainable text COLLATE pg_catalog."default",
    esgobligoroutcome text COLLATE pg_catalog."default",
    esgtransactionoutcome text COLLATE pg_catalog."default",
    loanapplication text COLLATE pg_catalog."default",
    loansubapplication text COLLATE pg_catalog."default",
    esgoveralloutcome text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;

ALTER TABLE olapts.report_esgoverallassessment OWNER to olap;

-----------------------------------
--Check if the tables were created
----------------------------------

--select * from olapts.esgreport
--select * from olapts.report_esgoverallassessment


