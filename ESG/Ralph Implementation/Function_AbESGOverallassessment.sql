-----------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                   Run script in OLAP database 
--(Script creates a function olapts.report_abesgoverallassessment which takes a date as parameter and populate olapts.report_abesgoverallassessment table)
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- FUNCTION: olapts.report_abesgoverallassessment(date)

-- DROP FUNCTION olapts.report_abesgoverallassessment(date);

CREATE OR REPLACE FUNCTION olapts.report_abesgoverallassessment(ref_date date)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
 pl_status boolean:=FALSE;
begin
	
	TRUNCATE TABLE olapts.report_abesgoverallassessment; 
	
    insert into olapts.report_abesgoverallassessment (
       select distinct on (assess.entityid)
	           assess.assessmentdate::timestamp AT TIME ZONE 'UTC' AT TIME ZONE 'Europe/Athens' as assessmentdate
	          ,assess.assessmentuser
	          ,entity.gc18
	          ,entity.cdicode
	          ,assess.issustainable
	          ,assess.esgobligoroutcome
	          ,assess.esoutcome --esg transaction outcome
	          ,assess.loanapplication --arithmos aitisis
	          ,assess.loansubapplication --arithmos ipo aitisis
	          ,assess.esgoveralloutcome
       from olapts.abesgoverallassessment assess
       left join olapts.abfactentity entity on assess.entityid::int=entity.entityid::int and assess.entityversionid::int = entity.versionid_::int
       where assess.islatestversion_ 	
	         and assess.sourcepopulateddate_ <= cast( ref_date as date) + time '23:59:59'  	  
	         and assess.isdeleted_='false' and assess.isvisible_ and assess.isvalid_
       order by assess.entityid, assess.sourcepopulateddate_ desc	
);

pl_status:=TRUE;
RETURN pl_status;
EXCEPTION 
	WHEN OTHERS THEN	
		Return pl_status;		
end;
$BODY$;

ALTER FUNCTION olapts.report_abesgoverallassessment(date) OWNER TO olap;

-------------------------------------------------------------
--Check if the function was created and table was populated
-------------------------------------------------------------

--select * from olapts.report_abesgoverallassessment('2023-12-14')
--select * from olapts.report_abesgoverallassessment
