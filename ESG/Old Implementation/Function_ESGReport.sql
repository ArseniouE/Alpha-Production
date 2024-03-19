-----------------------------------------------------------------------------------------------------------------
--
--                                      Run script in OLAP database 
--
--(Script creates a function olapts.esgreport which takes a date as parameter and populate olapts.esgreport table)
-----------------------------------------------------------------------------------------------------------------

--FUNCTION: olapts.esgreport(date)

--DROP FUNCTION olapts.esgreport(date);

CREATE OR REPLACE FUNCTION olapts.esgreport(IN ref_date date)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
pl_count integer :=0;
pl_sourcecount integer :=0;
pl_targetcount integer :=0;
pl_status boolean:=FALSE;
pl_function varchar;
pl_targettablename varchar;
pl_jobid varchar;
pl_sourcetablename varchar;
pl_message varchar:='';
stack text;
pl_maxdate varchar;
pl_maxsourcedate timestamp;
pl_maxtargetdate timestamp;
v_sql varchar;
pl_schema varchar:='olapts'; 
begin

    pl_jobid:='populate_report'||TO_CHAR(now(), 'yyyymmddHH24MI')::varchar;

	GET DIAGNOSTICS stack = PG_CONTEXT;
	pl_function:= substring(stack from 'function (.*?) line');
	pl_function:= substring(pl_function,1,length(pl_function)-2);
	-- RAISE Notice 'pl_function (%)',pl_function;
	pl_targettablename:='esgreport';
	
	TRUNCATE TABLE olapts.esgreport; 
	
----------------------------ESG Obligor Report---------------------------------

drop table if exists latest_assessment;
create temporary table latest_assessment as
select distinct on (assess.pkid_,entity.gc18, entity.cdicode) 
			  assess.pkid_ 
        	  ,assess.entityid 
        	  ,entity.gc18::char(20) gc18 
        	  ,case when ltrim(entity.gc18::char(20),'0') in ('999999999','777777777') --non 999999999, 777777777
			        or (ltrim(entity.gc18::char(20),'0') ~* '[a-z]')=true --non alphanumeric
        	  		or (ltrim(entity.gc18::char(20),'0') ~* '[α-ω]')=true --non alphanumeric
					or (ltrim(entity.gc18::char(20),'0')~*'[Α-Ω]')=true --non alphanumeric
					or (ltrim(entity.gc18::char(20),'0')~*'[A-Z]')=true --non alphanumeric
					or coalesce(entity.gc18,'0') ~ '^[0]+$' --non zero		
				    then '000000000'::char(20) 
					else ltrim(entity.gc18::char(20),'0')::char(20) 
			   end as gc18_new							
        	  ,entity.cdicode::char(10) 
        	  ,assess.questionnairedate 
        	  ,assess.assessmentdate 
        	  ,assess.approvaldate 
        	  ,assess.creditcommitteedate 
        	  ,assess.nextreviewdate 
              ,case when entity.creditcommittee in (select key_ from olapts.credit_committee_lookup) then creditcommitte_lookup.datamart_code
        	        when entity.creditcommittee not in (select key_ from olapts.credit_committee_lookup) and creditcommittee <>'' then '-100' 
        	        else null	
        	   end as creditcommittee 
        	  ,assess.assessmentuser
        	  ,assess.overridereason 
        	  ,approvaluser 
        	  ,case when entity.businessportfolio in (select businessportfoliokey_ from olapts.businessportfolio_lookup) then businessportfoliolookup.datamart_code
        	        when entity.businessportfolio not in (select businessportfoliokey_ from olapts.businessportfolio_lookup) and businessportfolio <>'' then '-100' 
        	        else null	
        	   end as businessportfolio 
        	  ,assess.overridedriver 
        	  ,case when assess.overridegrade is null then '01' --systemic 
        	        else '02' --override
        	   end as overridegrade 
        	  ,case when assess.esubscore::decimal(19,2) > 0 then replace(concat('+', lpad(rPAD((assess.esubscore::decimal(16,8))::text,10, '0'), 16, '0')),'.',',')
 					when assess.esubscore::decimal(19,2) < 0 then replace(concat('-',  lpad(rPAD((assess.esubscore::decimal(16,8))::text, 10, '0'), 16, '0')),'.',',') else null
                  end as esubscore 
        	  ,case when assess.esubzone = 'red'   then '01'
        	        when assess.esubzone = 'amber' then '02'
        	        when assess.esubzone = 'green' then '03'
        	        when assess.esubzone not in ('red','amber','green') and assess.esubzone is not null then '-100'
        	        else null
                end as esubzone 
        	  ,case when assess.ssubscore::decimal(19,2) > 0 then replace(concat('+', lpad(rPAD((assess.ssubscore::decimal(16,8))::text,10, '0'), 16, '0')),'.',',')
 					when assess.ssubscore::decimal(19,2) < 0 then replace(concat('-',  lpad(rPAD((assess.ssubscore::decimal(16,8))::text, 10, '0'), 16, '0')),'.',',') else null
                  end as ssubscore 
        	  ,case when assess.ssubzone = 'red'   then '01'
        	        when assess.ssubzone = 'amber' then '02'
        	        when assess.ssubzone = 'green' then '03'
        	        when assess.ssubzone not in ('red','amber','green') and assess.ssubzone is not null then '-100'
        	        else null
               end as ssubzone 
        	  ,case when assess.gsubscore::decimal(19,2) > 0 then replace(concat('+', lpad(rPAD((assess.gsubscore::decimal(16,8))::text,10, '0'), 16, '0')),'.',',')
 					when assess.gsubscore::decimal(19,2) < 0 then replace(concat('-',  lpad(rPAD((assess.gsubscore::decimal(16,8))::text, 10, '0'), 16, '0')),'.',',') else null 
               end as gsubscore 
        	  ,case when assess.gsubzone = 'red'   then '01'
        	        when assess.gsubzone = 'amber' then '02'
        	        when assess.gsubzone = 'green' then '03'
        	        when assess.gsubzone not in ('red','amber','green') and assess.gsubzone is not null then '-100'
        	        else null
                end as gsubzone 			   
        	  ,case when assess.totalesgscore::decimal(19,2) > 0 then replace(concat('+', lpad(rPAD((assess.totalesgscore::decimal(16,8))::text,10, '0'), 16, '0')),'.',',')
 					when assess.totalesgscore::decimal(19,2) < 0 then replace(concat('-',  lpad(rPAD((assess.totalesgscore::decimal(16,8))::text,10, '0'), 16, '0')),'.',',') else null 
               end as totalesgscore 		   
        	  ,case when assess.esgzonesoutcome = 'red'   then '01'
        	        when assess.esgzonesoutcome = 'amber' then '02'
        	        when assess.esgzonesoutcome = 'green' then '03'
        	        when assess.esgzonesoutcome not in ('red','amber','green') and assess.esgzonesoutcome is not null then '-100'
        	        else null
               end as esgzonesoutcome 
        	  ,case when assess.questionnairetype is null and lpad(replace(companynacecode,'.',''),4,'0') is null then null
        	        else concat(assess.questionnairetype,'/',lpad(replace(companynacecode,'.',''),4,'0'))
        	   end as questionnairetype			   
        	  ,assess.questionnaireid 
        	  ,assess.questionnaireversion 
        	  ,entity.registrationnumber 
        	  ,entity.jurisdiction 
			  ,assess.sourcepopulateddate_ as sourcepopulateddate_assess
			  ,assess.expirationdate			  
from olapts.factesgassessment assess
left join olapts.factentity entity on assess.entityid::int = entity.entityid and assess.entityversionid::int = entity.versionid_ 
--left join olapts.nace_industry_lookup nace_lookup on lpad(replace(companynacecode,'.',''),4,'0')= nace_lookup.Key_ 			   
left join olapts.Credit_Committee_Lookup creditcommitte_lookup on entity.creditcommittee = creditcommitte_lookup.key_
left join olapts.businessportfolio_lookup businessportfoliolookup on entity.businessportfolio = businessportfoliolookup.businessportfoliokey_
where assess.authorizationflag  --isapproved
	  --and assess.islatestversion_ 
	  --and assess.expirationdate is null 
	 and assess.sourcepopulateddate_ <= cast(ref_date as date) + time '23:59:59'	 	  
order by assess.pkid_, entity.gc18, entity.cdicode, assess.sourcepopulateddate_ desc;

---------------------FINAL_TABLE--------------------

insert into olapts.esgreport (
select distinct on (case when INV_PTY_RTG_OBLG_TAX_ID != '000000000'  then INV_PTY_RTG_OBLG_TAX_ID else INV_PTY_RTG_OBLG_CDI_CODE end) *	
from (
	  select distinct on (INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE) 
        	'2'::smallint as RECORD_TYPE
        	,ref_date AS AS_OF_DT --parameter
        	,'SDP'::char(5) as SRC_STM_CODE
        	,coalesce(pkid_,'')::char(40) UNQ_ASSES_ID  
        	,coalesce(entityid,'')::char(10) INV_PTY_RTG_ENT_ID
			,case when length(trim(gc18_new))<9 then coalesce(lpad(trim(gc18_new),9,'0'),'')::char(20) else coalesce(trim(gc18_new),'')::char(20) end as INV_PTY_RTG_OBLG_TAX_ID
	        ,coalesce(trim(cdicode),'')::char(10) INV_PTY_RTG_OBLG_CDI_CODE	  
        	,coalesce(TO_CHAR(questionnairedate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_EV_DT  
        	,coalesce(TO_CHAR(assessmentdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_STM_RTRVL_DT  
        	,coalesce(TO_CHAR(assessmentdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_ASSES_DT 	  
        	,coalesce(TO_CHAR(approvaldate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_APRV_RTG_APRV_DT  	  
        	,coalesce(TO_CHAR(creditcommitteedate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_CR_CMTE_DT  	  
        	,coalesce(TO_CHAR(nextreviewdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_NEXT_RVW_DT  	  
        	,coalesce(creditcommittee,'')::char(5) INV_PTY_RTG_APRV_AHR_ID  
        	,coalesce(assessmentuser,'')::char(50) INV_PTY_RTG_ANL_NM
        	,coalesce(overridereason,'')::char(5) INV_PTY_RTG_OVRD_RSN_TP_ID  
        	,coalesce(approvaluser,'')::char(50) INV_PTY_RTG_APRV_NM
        	,coalesce(businessportfolio,'')::char(5) INV_PTY_RTG_BSN_PRTF -- INV_PTY_RTG_BSN_PRTF
        	,coalesce(overridedriver,'')::char(5) INV_PTY_RTG_OVRD_DRVR  
        	,coalesce(overridegrade,'')::char(5) INV_PTY_RTG_TP 
        	,coalesce(esubscore,'N0000000,00000000')::char(17) INV_PTY_RTG_ENVRNM_SCOR	  
        	,coalesce(esubzone,'')::char(5) INV_PTY_RTG_ENVRNM_ZON
        	,coalesce(ssubscore,'N0000000,00000000')::char(17) INV_PTY_RTG_SCL_SCOR 
        	,coalesce(ssubzone,'')::char(5) INV_PTY_RTG_SCL_ZON  
        	,coalesce(gsubscore,'N0000000,00000000')::char(17) INV_PTY_RTG_GVRNC_SCOR  
        	,coalesce(gsubzone,'')::char(5) INV_PTY_RTG_GVRNC_ZON
        	,coalesce(totalesgscore,'N0000000,00000000')::char(17) INV_PTY_RTG_ESG_SCOR  
        	,coalesce(esgzonesoutcome,'')::char(5) INV_PTY_RTG_ESG_ZON  
        	,coalesce(questionnairetype,'')::char(100) INV_PTY_RTG_TP_SCTR	  
        	,coalesce(questionnaireid,'')::char(50) QUEST_ID
        	,coalesce(questionnaireversion,'')::char(50) QUEST_VRSN
            ,coalesce(registrationnumber,'')::char(50) OBLG_RGSTRN_NUM
        	,coalesce(jurisdiction,'')::char(5) JRSCTN
from latest_assessment
where expirationdate is null 
	or cast(expirationdate as date) = cast(ref_date as date) --edit 11/01/2024
order by INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE, sourcepopulateddate_assess desc
)x
order by case when INV_PTY_RTG_OBLG_TAX_ID != '000000000'  then INV_PTY_RTG_OBLG_TAX_ID else INV_PTY_RTG_OBLG_CDI_CODE end, INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE
);

GET DIAGNOSTICS pl_targetcount := ROW_COUNT;
--RAISE Notice 'Number of rows upserted: %',pl_targetcount;	
 
--RAISE NOTICE 'Success in function %',pl_function;
pl_message:=pl_schema||'.'||pl_targettablename||' has been populated ';
 
--RAISE NOTICE 'Success in function %',pl_function;
pl_message:=pl_schema||'.'||pl_targettablename||' has been populated ';
perform  olapts.save_olapetllog(jsonb_build_object('id_',(SELECT nextval(pl_schema||'.olapetllog_sequence'))
		,'t_',pl_schema||'.olapetllog','JobId',pl_jobid,'ETLFunction',pl_function
		,'SourceTableName',pl_sourcetablename,'SourceTableCount',pl_sourcecount
		,'TargetTableName',pl_targettablename,'TargetTableCount',pl_targetcount
		,'LogMessage',pl_message,'SchemaName',pl_schema
		));
 
pl_status:=TRUE;
RETURN pl_status;	
 
EXCEPTION 
	WHEN OTHERS THEN
		pl_message:='Failure in function: '||pl_function||':'||SQLSTATE||'-'||SQLERRM;
		perform  olapts.save_olapetllog(jsonb_build_object('id_',(SELECT nextval(pl_schema||'.olapetllog_sequence'))
		,'t_',pl_schema||'.olapetllog','JobId',pl_jobid,'ETLFunction',pl_function
		,'SourceTableName',pl_sourcetablename,'SourceTableCount',pl_sourcecount
		,'TargetTableName',pl_targettablename,'TargetTableCount',pl_targetcount
		,'LogMessage',pl_message,'SchemaName',pl_schema
		));
		RAISE Notice '%',pl_message;
		Return pl_status;
end;
$BODY$;

ALTER FUNCTION olapts.esgreport(date) OWNER TO olap;

-------------------------------------------------------------
--Check if the function was created and table was populated
-------------------------------------------------------------

--select * from olapts.esgreport('2023-12-11')
--select * from olapts.esgreport
