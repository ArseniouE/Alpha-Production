----------------------------------------------------------------------------------
--                           Run script in OLAP database
----------------------------------------------------------------------------------

--------------------------------------------------------------
--                Table: olapts.rmdb_report
--------------------------------------------------------------

DROP VIEW IF EXISTS olapts.rmdb_view;
DROP TABLE IF EXISTS olapts.rmdb_report;

CREATE TABLE olapts.rmdb_report
(
    cdi text COLLATE pg_catalog."default",
    afm text COLLATE pg_catalog."default",
    csh numeric(19,2),
    ebitda numeric(19,2),
    eqty numeric(19,2),
    gdwill numeric(19,2),
    nt_incm numeric(19,2),
    sales_revenue numeric(19,2),
    netfixedassets numeric(19,2),
    inventory numeric(19,2),
    nettradereceivables numeric(19,2),
    totalassets numeric(19,2),
    commonsharecapital numeric(19,2),
    tradepayable numeric(19,2),
    totalbankingdebt numeric(19,2),
    shorttermbankingdebt numeric(19,2),
    longtermbankingdebt numeric(19,2),
    totalliabilities numeric(19,2),
    grossprofit numeric(19,2),
    ebit numeric(19,2),
    profitbeforetax numeric(19,2),
    workingcapital numeric(19,2),
    flowsoperationalactivity numeric(19,2),
    flowsinvestmentactivity numeric(19,2),
    flowsfinancingactivity numeric(19,2),
    chgcommonsharecapital_chgsharepremium numeric,
    balancedividendspayable numeric(19,2),
    grossprofitmargin numeric(19,2),
    netprofitmargin numeric(19,2),
    ebitdamargin numeric(19,2),
    totalbankingdebttoebitda numeric,
    netbankingdebttoebitda numeric,
    totalliabilitiestototalequity numeric(19,2),
    returnonassets numeric(19,2),
    returnonequity numeric(19,2),
    interestcoverage numeric,
    currentratio numeric(19,2),
    quickratio numeric(19,2),
	dscr numeric(19,2),--new
    fnc_year text COLLATE pg_catalog."default",
    creditcommitteedate text COLLATE pg_catalog."default",
    publish_date text COLLATE pg_catalog."default",
    approveddate character varying(30) COLLATE pg_catalog."default",
    reference_date text COLLATE pg_catalog."default",
    entityid text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;

ALTER TABLE olapts.rmdb_report OWNER to olap;
	
-----------------------------------
--Check if the table was created
----------------------------------

--select * from olapts.rmdb_report