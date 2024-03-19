----------------------------------------------------------------------------------
--
--                         Run script in OLAP database 
--
----------------------------------------------------------------------------------

--------------------------------------------------------------
--                 VIEW: olapts.esgreport_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.esgreport_view;

CREATE OR REPLACE VIEW olapts.esgreport_view AS
 SELECT * FROM olapts.esgreport;

ALTER TABLE olapts.esgreport_view OWNER TO olap;

--------------------------------------------------------------
--         VIEW: olapts.report_esgoverallassessment_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.report_esgoverallassessment_view;

CREATE OR REPLACE VIEW olapts.report_esgoverallassessment_view AS
 SELECT * FROM olapts.report_esgoverallassessment;

ALTER TABLE olapts.report_esgoverallassessment_view OWNER TO olap;

-----------------------------------
--Check if the views were created
-----------------------------------

--select * from olapts.esgreport_view;
--select * from olapts.report_esgoverallassessment_view;
