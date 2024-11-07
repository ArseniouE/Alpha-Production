--------------------------------------------------------------
--         VIEW: olapts.rmdb_view
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.rmdb_view;

CREATE OR REPLACE VIEW olapts.rmdb_view AS
 SELECT * FROM olapts.rmdb_report;

ALTER TABLE olapts.rmdb_view OWNER TO olap;

-----------------------------------
--Check if the view was created
-----------------------------------

--select * from olapts.rmdb_view;