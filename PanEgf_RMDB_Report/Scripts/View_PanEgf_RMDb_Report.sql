----------------------------------------------------------------------------------
--                         Run script in OLAP database 
----------------------------------------------------------------------------------

--------------------------------------------------------------
--                 VIEW: olapts.panegf_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.panegf_view;

CREATE OR REPLACE VIEW olapts.panegf_view AS
 SELECT * FROM olapts.panegf_report;

ALTER TABLE olapts.panegf_view OWNER TO olap;

-----------------------------------
--Check if the view was created
-----------------------------------

--select * from olapts.panegf_view;



