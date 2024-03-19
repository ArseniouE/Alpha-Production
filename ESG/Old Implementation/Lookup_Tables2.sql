-----------------------------------------------------------------------------------------------------
--
--                              Run script in OLAP database 
--
--(Script creates two lookup tables olapts.businessportfolio_lookup and olapts.Credit_Committee_Lookup)
-----------------------------------------------------------------------------------------------------

--------------------------------------------------------------
--                  businessportolio
--------------------------------------------------------------

drop table if exists olapts.businessportfolio_lookup;

CREATE TABLE olapts.businessportfolio_lookup(
	businessportfoliokey_ character varying , 
	businessportfoliovalue character varying, 
	datamart_code character varying,
	datamart_description character varying
);

INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'1', N'ICAP', N'99999', N'ICAP')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'2', N'Δ/ΝΣΗ CORPORATE BANKING', N'9198', N'ΔΙΕΥΘΥΝΣΗ CORPORATE BANKING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'3', N'BUSINESS CENTER OF ATHENS AND VIOTIA', N'923', N'BUSINESS CENTER OF ATHENS AND VIOTIA')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'4', N'BUSINESS CENTER OF EΑSTERN AND SOUTHERN ATTICA', N'924', N'BUSINESS CENTER OF EΑSTERN AND SOUTHERN ATTICA')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'6', N'BUSINESS CENTER OF NORTHERN ATTICA AND EVIA', N'926', N'BUSINESS CENTER OF NORTHERN ATTICA AND EVIA')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'8', N'BUSINESS CENTER OF THESSALONIKI, EASTERN MACEDONIA AND THRACE', N'928', N'BUSINESS CENTER OF THESSALONIKI, EASTERN MACEDONIA AND THRACE')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'11', N'BUSINESS CENTER OF CENTRAL GREECE AND EPIRUS', N'931', N'BUSINESS CENTER OF CENTRAL GREECE AND EPIRUS')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'14', N'Δ/ΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ', N'9249', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'15', N'SHIPPING', N'9248', N'SHIPPING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'16', N'ABC FACTORS', N'2001', N'ABC FACTORS ΠΡΑΚΤΟΡΕΙΑ ΕΠΙΧΕΙΡΗΜΑΤΙΚΩΝ ΑΠΑΙΤΗΣΕΩΝ A.E.')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'17', N'Δ/ΝΣΗ PRIVATE BANKING', N'950', N'ΔΙΕΥΘΥΝΣΗ PRIVATE BANKING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'18', N'TRANSACTION BANKING SOLUTIONS', N'9160', N'TRANSACTION BANKING SOLUTIONS')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'20', N'HOSPITALITY', N'933', N'HOSPITALITY')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'21', N'TREASURY', N'9161', N'TREASURY')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'22', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ', N'941', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'23', N'BUSINESS CENTER OF WESTERN ATTICA, PELOPONNESE AND WESTERN MAINLAND GREECE',	N'932',	N'BUSINESS CENTER OF WESTERN ATTICA, PELOPONNESE AND WESTERN MAINLAND GREECE')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'24', N'BUSINESS CENTER OF THESSALONIKI, CENTRAL AND WESTERN MACEDONIA', N'925', N'BUSINESS CENTER OF THESSALONIKI, CENTRAL AND WESTERN MACEDONIA')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'25', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ–W', N'9411', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΩΝ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ - W')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'71', N'COMMERCIAL REAL ESTATE', N'9269', N'COMMERCIAL REAL ESTATE')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'72', N'INFRASTRUCTURE', N'9270', N'INFRASTRUCTURE')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'73', N'INDUSTRIAL AND RESOURCES', N'9271', N'INDUSTRIAL AND RESOURCES')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'74', N'TECHNOLOGY, HEALTHCARE AND FINANCIAL SPONSORS', N'9272', N'TECHNOLOGY, HEALTHCARE AND FINANCIAL SPONSORS')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'75', N'INTERNATIONAL SYNDICATIONS AND LEVERAGED FINANCE', N'9273', N'INTERNATIONAL SYNDICATIONS AND LEVERAGED FINANCE')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'76', N'REPERFORMING LOANS- LC', N'9274', N'REPERFORMING LOANS- LC')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'77', N'REPERFORMING LOANS- SMES', N'9275', N'REPERFORMING LOANS- SMES')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'78', N'POWER AND UTILITIES', N'9276', N'POWER AND UTILITIES')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'79', N'WHOLESALE TRADE AND FOOD ENTERPRISES', N'9277', N'WHOLESALE TRADE AND FOOD ENTERPRISES')
;

ALTER TABLE olapts.businessportfolio_lookup OWNER to olap;
	
--------------------------------------------------------------
--                  Credit_Committee
--------------------------------------------------------------

drop table if exists olapts.Credit_Committee_Lookup;

CREATE TABLE olapts.Credit_Committee_Lookup(
    key_ character varying ,
    datamart_code character varying,
	datamart_description character varying
);

INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ABC FACTORS', N'1051', N'ABC FACTORS - ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ABC FACTORS')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ', N'1052', N'ΑΒC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ ABC FACTORS', N'1053', N'ΑΒC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ ABC FACTORS')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΤΜΗΜΑ ΑΞΙΟΛ ΚΙΝΔΥΝΟΥ ΟΦΕΙΛΕΤΩΝ', N'1054', N'ABC FACTORS- ΤΜΗΜΑ ΑΞΙΟΛ. ΚΙΝΔΥΝΟΥ ΟΦΕΙΛΕΤΩΝ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΓΕΝΙΚΗ ΔΙΕΥΘΥΝΣΗ', N'1055', N'ABC FACTORS - ΓΕΝΙΚΗ ΔΙΕΥΘΥΝΣΗ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING I', N'1150', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING II', N'1151', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING ΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING III', N'1152', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING ΙΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING IV', N'1153', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING IV')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING - ΣΥΜΒΟΥΛΙΟ Α', N'1154', N'ΣΥΜΒΟΥΛΙΑ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING- ΣΥΜΒΟΥΛΙΟ Α')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING - ΣΥΜΒΟΥΛΙΟ Β', N'1155', N'ΣΥΜΒΟΥΛΙΑ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING- ΣΥΜΒΟΥΛΙΟ Β')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING I', N'1156', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING II', N'1157', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING IΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING III', N'1158', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING IΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. Ι', N'1161', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙΙ', N'1162', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ II')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙΙΙ', N'1163', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ III - (ΜΙΚΡΕΣ ΕΠΙΧΕΙΡΗΣΕΙΣ)')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙV', N'1164', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ IV')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING I', N'1180', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING II', N'1181', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING II')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'CEPAL', N'1182', N'CEPAL')
;
ALTER TABLE olapts.Credit_Committee_Lookup OWNER to olap;

-----------------------------------
--Check if the tables were created
----------------------------------

--select * from olapts.businessportfolio_lookup order by businessportfoliokey_::int --18
--select * from olapts.Credit_Committee_Lookup order by key_ --21
