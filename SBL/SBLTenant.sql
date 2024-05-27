-- FUNCTION: tenant.sblfunction(character varying)

-- DROP FUNCTION tenant.sblfunction(character varying);

CREATE OR REPLACE FUNCTION tenant.sblfunction(
	afmparam character varying)
    RETURNS TABLE(afm character varying, statuscode integer, statusmessage character varying, realestatestatus character varying, projectfinancestatus character varying, realestatescore character varying, realestatedate timestamp without time zone, projectfinancescore character varying, projectfinancedate timestamp without time zone, loanlifecycleratio numeric, projectlifecoverageratio numeric, internalrateofreturn numeric, debttoequityratio numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE 
   rownumberentity int;
   rownumber int;
   rownumberprojfinance int;
   projfinancellcr numeric;
   projfinanceplcr numeric;
   projfinanceirr numeric;
   projfinancedebt numeric;
   id_ratingscenario varchar;
BEGIN

DROP TABLE IF EXISTS my_table;
DROP TABLE IF EXISTS projfinance;

create temp table my_table
(afm varchar(15) ,
statuscode int,
statusmessage varchar(50),
realestatestatus varchar(20),
projectfinancestatus varchar(20),
realestatescore varchar(30),
realestatedate timestamp without time zone ,
projectfinancescore varchar(30),
projectfinancedate timestamp without time zone,
loanlifecycleratio numeric,
projectlifecoverageratio numeric,
internalrateofreturn numeric,
debttoequityratio numeric,
pkid_ varchar);

--check if received afm is 0 
IF cast(afmparam as numeric) = 0 THEN
RETURN QUERY 
         SELECT 
		       '0'::varchar as afm
		       ,1 as statuscode
			   ,'ΔΕΝ ΥΠΟΣΤΗΡΙΖΕΤΑΙ ΜΗΔΕΝΙΚΟΣ ΠΕΛΑΤΗΣ'::varchar as statusmessage
			   ,'Not Found'::varchar as realestatestatus
			   ,'Not Found'::varchar as projectfinancestatus
			   ,null::varchar as realestatescore,null::timestamp without time zone as realestatedate,null::varchar as projectfinancescore,null::timestamp without time zone as projectfinancedate
			   ,null::numeric as loanlifecycleratio,null::numeric as projectlifecoverageratio, null::numeric as internalrateofreturn, null::numeric as debttoequityratio;			   
			   RETURN;
END IF;

--Check if the customer exists 
IF afmparam <> '0' THEN

	SELECT COUNT(*) INTO rownumberentity
	from tenant.entity
	where (jsondoc_->>'Gc18') = afmparam;
	
	--afmparam;	
	
	IF rownumberentity = 0 THEN
      RETURN QUERY 
         SELECT 
		       afmparam::varchar as afm
		       ,1 as statuscode
			   ,'ΔΕΝ ΕΙΝΑΙ ΠΕΛΑΤΗΣ'::varchar as statusmessage
			   ,'Not Found'::varchar as realestatestatus
			   ,'Not Found'::varchar as projectfinancestatus
			   ,null::varchar as realestatescore,null::timestamp without time zone as realestatedate,null::varchar as projectfinancescore,null::timestamp without time zone as projectfinancedate
			   ,null::numeric as loanlifecycleratio,null::numeric as projectlifecoverageratio, null::numeric as internalrateofreturn, null::numeric as debttoequityratio;			   
			   RETURN;
	END IF;		   
END IF;

	insert into my_table(afm,statuscode,statusmessage,projectfinancestatus,realestatescore,realestatedate,realestatestatus)
		select distinct on (t2.jsondoc_->>'Gc18') 	    
		t2.jsondoc_->>'Gc18' as afm
		,case when t2.jsondoc_->>'Gc18' = '0' then 1 else 0 end  as StatusCode
		,case when t2.jsondoc_->>'Gc18' = '0' then 'ΔΕΝ ΥΠΟΣΤΗΡΙΖΕΤΑΙ ΜΗΔΕΝΙΚΟΣ ΠΕΛΑΤΗΣ' ELSE 'ΟΛΑ ΚΑΛΑ' end as statusmessage
		,'Not Found' as projectfinancestatus
		,t3.jsondoc_->>'Grade' as realestatescore
		,t1.createddate_ as realestatedate
		--,cast(t1.jsondoc_->>'ApprovedDate' as timestamp) as realestatedate 
		,case when  t1.jsondoc_->>'ApprovalStatus' = '2' then 'Approved' else 'Pending' end as realestatestatus	 
		from tenant.ratingscenario t1
		left join tenant.entity t2 on t1.jsondoc_->>'EntityId' = t2.jsondoc_->>'EntityId'
		left join tenant.custom_lookup t3 on t3.jsondoc_->>'Id' = substring(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),0,strpos(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),'#'))
								      and t3.jsondoc_->>'Type' = 'MODELGRADES'
		where t1.jsondoc_->>'ModelId' =  ('REAL_ESTATE')
		and t2.jsondoc_->>'Gc18' = afmparam
		order by t2.jsondoc_->>'Gc18', GREATEST(t1.createddate_,t1.updateddate_) desc;

   select count(*) into rownumber 
   from my_Table;
 
 if rownumber = 1 then
   BEGIN
	 create temp table projfinance
	( afm varchar(15)
	 ,statuscode int
	 ,statusmessage varchar(50)
	 ,projectfinancestatus varchar(20) 
	 , projectfinancescore varchar(30)
	 , projectfinancedate timestamp without time zone
	 ,fkid_ratingscenario varchar(100));
	 
	  insert into projfinance (afm,statuscode,statusmessage,projectfinancestatus,projectfinancescore,projectfinancedate,fkid_ratingscenario) 
        select distinct on (t2.jsondoc_->>'Gc18') 	    
	    t2.jsondoc_->>'Gc18' as afm
	    ,case when t2.jsondoc_->>'Gc18' = '0' then 1 else 0 end  as StatusCode
	    ,case when t2.jsondoc_->>'Gc18' = '0' then 'ΔΕΝ ΥΠΟΣΤΗΡΙΖΕΤΑΙ ΜΗΔΕΝΙΚΟΣ ΠΕΛΑΤΗΣ' ELSE 'ΟΛΑ ΚΑΛΑ' end as statusmessage
		,case when  t1.jsondoc_->>'ApprovalStatus' = '2' then 'Approved' else 'Pending' end as projectfinancestatus
		,t3.jsondoc_->>'Grade' as projectfinancescore
		,t1.createddate_ as projectfinancedate
		--,cast(t1.jsondoc_->>'ApprovedDate' as timestamp) as projectfinancedate	
		,t1.pkid_
		from tenant.ratingscenario t1
	    left join tenant.entity t2 on t1.jsondoc_->>'EntityId' = t2.jsondoc_->>'EntityId'
	    left join tenant.custom_lookup t3 on t3.jsondoc_->>'Id' = substring(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),0,strpos(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),'#'))
								      and t3.jsondoc_->>'Type' = 'MODELGRADES'
		where t1.jsondoc_->>'ModelId' =  ('PROJECT_FINANCE')
		and t2.jsondoc_->>'Gc18' = afmparam
	    order by t2.jsondoc_->>'Gc18', GREATEST(t1.createddate_,t1.updateddate_) desc;
		
		
		
		select fkid_ratingscenario into id_ratingscenario 
		from projfinance;
		
		RAISE NOTICE  'scenario id is %',id_ratingscenario;
		
        --------poiotika------	
		
		--6ca0d5c5-0a10-49ea-8ec8-4e962a747290	
		
		select cast(e->>'Value'  as numeric) into projfinanceplcr	
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--jsondoc_->>'RatingScenarioId' = '6ca0d5c5-0a10-49ea-8ec8-4e962a747290'		
		and e->>'BlockId' = 'PROJECT_FINANCE.ProjectLifeCoverageRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinancellcr
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.LoanLifeCoverageRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinancedebt
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.DebtToEquityRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinanceirr
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.InterestRateRisk' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		----------------------
		
		update  my_table
        set projectfinancestatus = b.projectfinancestatus,
        projectfinancescore=b.projectfinancescore,
	    projectfinancedate=b.projectfinancedate,
		loanlifecycleratio=projfinancellcr,
		projectlifecoverageratio=projfinanceplcr,
		internalrateofreturn=projfinanceirr,
		debttoequityratio=projfinancedebt
	    from my_table a
		--where a.afm = afmparam;
	    inner join projfinance b on b.AFM = a.AFM;
   END;
 ELSE 
 
      insert into my_table(afm,statuscode,statusmessage,realestatestatus,projectfinancestatus,projectfinancescore,projectfinancedate,pkid_)
        select distinct on (t2.jsondoc_->>'Gc18') 	    
	    t2.jsondoc_->>'Gc18' as afm
	    ,case when t2.jsondoc_->>'Gc18' = '0' then 1 else 0 end  as StatusCode
	    ,case when t2.jsondoc_->>'Gc18' = '0' then 'ΔΕΝ ΥΠΟΣΤΗΡΙΖΕΤΑΙ ΜΗΔΕΝΙΚΟΣ ΠΕΛΑΤΗΣ' ELSE 'ΟΛΑ ΚΑΛΑ' end as statusmessage
		,'Not Found' as realestatestatus
		,case when  t1.jsondoc_->>'ApprovalStatus' = '2' then 'Approved' else 'Pending' end as projectfinancestatus
		,t3.jsondoc_->>'Grade' as projectfinancescore
		,t1.createddate_ as projectfinancedate
		--,cast(t1.jsondoc_->>'ApprovedDate' as timestamp) as projectfinancedate	
		,t1.pkid_
		from tenant.ratingscenario t1
	    left join tenant.entity t2 on t1.jsondoc_->>'EntityId' = t2.jsondoc_->>'EntityId'
	    left join tenant.custom_lookup t3 on t3.jsondoc_->>'Id' = substring(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),0,strpos(coalesce(t1.jsondoc_->>'FinalGrade'::text,t1.jsondoc_->>'ModelGrade'::text),'#'))
								      and t3.jsondoc_->>'Type' = 'MODELGRADES'
		where t1.jsondoc_->>'ModelId' =  ('PROJECT_FINANCE')
		and t2.jsondoc_->>'Gc18' = afmparam	
	    order by t2.jsondoc_->>'Gc18', GREATEST(t1.createddate_,t1.updateddate_) desc;

		select count(*) into rownumberprojfinance 
		   from my_Table;	
		
		IF rownumberprojfinance = 0 THEN
		  RETURN QUERY
		   SELECT 
		       afmparam::varchar as afm
		       ,0 as statuscode
			   ,'ΟΛΑ ΚΑΛΑ'::varchar as statusmessage
			   ,'Not Found'::varchar as realestatestatus
			   ,'Not Found'::varchar as projectfinancestatus
			   ,null::varchar as realestatescore,null::timestamp without time zone as realestatedate,null::varchar as projectfinancescore,null::timestamp without time zone as projectfinancedate
			   ,null::numeric as loanlifecycleratio,null::numeric as projectlifecoverageratio, null::numeric as internalrateofreturn, null::numeric as debttoequityratio;			   
			   RETURN;
		ELSE
			   select pkid_ into id_ratingscenario 
		       from my_table;
			   
        --------poiotika------
		select cast(e->>'Value'  as numeric) into projfinanceplcr
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.ProjectLifeCoverageRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinancellcr
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.LoanLifeCoverageRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinancedebt
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.DebtToEquityRatio' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		select cast(e->>'Value'  as numeric) into projfinanceirr
	    from tenant.ratingscenarioblockdata r
		cross join lateral jsonb_array_elements(r.jsondoc_->'RatingBlockPinDatum') as e
		where fkid_ratingscenario = id_ratingscenario
		--where jsondoc_->>'RatingScenarioId' = id_ratingscenario
		and e->>'BlockId' = 'PROJECT_FINANCE.InterestRateRisk' and e->>'Name' = 'score'
		and r.islatestversion_;
		
		----------------------
		
				update  my_table
				set loanlifecycleratio=projfinancellcr,
				projectlifecoverageratio=projfinanceplcr,
				internalrateofreturn=projfinanceirr,
				debttoequityratio=projfinancedebt;
				--from my_table a
				--inner join projfinance b on b.AFM = a.AFM;
		END IF;   
		
 END IF; 
																							
RETURN QUERY 
         SELECT afmparam ,a.statuscode ,a.statusmessage ,a.realestatestatus ,a.projectfinancestatus ,
				   a.realestatescore ,a.realestatedate ,a.projectfinancescore ,a.projectfinancedate ,
				   a.loanlifecycleratio ,a.projectlifecoverageratio ,a.internalrateofreturn ,a.debttoequityratio 
				   FROM MY_TABLE a ;
		--select * 
		--from my_table;

END;
$BODY$;

ALTER FUNCTION tenant.sblfunction(character varying)
    OWNER TO tenant;



