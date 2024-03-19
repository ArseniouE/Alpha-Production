----------------------------------------------------------------------------------
--                         Run script in OLAP database 
----------------------------------------------------------------------------------

--------------------------------------------------------------
--                 VIEW: olapts.abesgreport_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.abesgreport_view;

CREATE OR REPLACE VIEW olapts.abesgreport_view AS
 SELECT * FROM olapts.abesgreport;

ALTER TABLE olapts.abesgreport_view OWNER TO olap;

--------------------------------------------------------------
--         VIEW: olapts.report_abesgoverallassessment_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.report_abesgoverallassessment_view;

CREATE OR REPLACE VIEW olapts.report_abesgoverallassessment_view AS
 SELECT * FROM olapts.report_abesgoverallassessment;

ALTER TABLE olapts.report_abesgoverallassessment_view OWNER TO olap;

-----------------------------------
--Check if the views were created
-----------------------------------

--select * from olapts.abesgreport_view;
--select * from olapts.report_abesgoverallassessment_view;
