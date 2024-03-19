------------------------------------------------------------------------------------------------
--
--                    Run script in OLAP database with OLAP user
--
--(Script creates three foreign tables in madata (v_esgassessment, v_esgoverallassessment,
--v_esgquestion) and three tables in olapts (factesgassessment, factesgoverallassessment, 
--factesgquestion) for esgassessment, esgoverallassessment, esgquestion respectively. Also, 
--it creates three new rows in olap_etl_control table).
------------------------------------------------------------------------------------------------

--------------------Drop existing tables/ rows --------------------

drop foreign table if exists madata.v_esgassessment;
drop table if exists olapts.factesgassessment;

drop foreign table if exists madata.v_esgquestion;
drop table if exists olapts.factesgquestion;

drop foreign table if exists madata.v_esgoverallassessment;
drop table if exists olapts.factesgoverallassessment;

delete from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion');

--------------------RUN FUNCTION olapts.populate_olapmetadata_views--------------------

select olapts.populate_olapmetadata_views( 'v_esgassessment', 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgoverallassessment', 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgquestion', 'fact' );

-------------------------------------------------------
--To check if the execution was implemented correctly
-------------------------------------------------------

--esgassessment
--select * from madata.v_esgassessment;
--select * from olapts.factesgassessment;

--esgquestion
--select * from madata.v_esgquestion;
--select * from olapts.factesgquestion;

--esgoverallassessment
--select * from madata.v_esgoverallassessment;
--select * from olapts.factesgoverallassessment;

--Check if column isactive_ is 'true' in olapts.olap_etl_control table 
--select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion')
--if column isactive_ = 'false' we have to update it to true as
--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion')

