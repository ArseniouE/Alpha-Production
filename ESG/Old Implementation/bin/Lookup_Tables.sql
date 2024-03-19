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
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'3', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΘΗΝΩΝ ΚΑΙ ΒΟΙΩΤΙΑΣ', N'923', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΘΗΝΩΝ ΚΑΙ ΒΟΙΩΤΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'4', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΝΑΤΟΛΙΚΗΣ ΚΑΙ ΝΟΤΙΑΣ ΑΤΤΙΚΗΣ', N'924', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΝΑΤΟΛΙΚΗΣ ΚΑΙ ΝΟΤΙΑΣ ΑΤΤΙΚΗΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'6', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΒΟΡΕΙΑΣ ΑΤΤΙΚΗΣ ΚΑΙ ΕΥΒΟΙΑΣ', N'926', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΒΟΡΕΙΑΣ ΑΤΤΙΚΗΣ ΚΑΙ ΕΥΒΟΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'8', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΑΝΑΤΟΛΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ ΚΑΙ ΘΡΑΚΗΣ', N'928', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΑΝΑΤΟΛΙΚΗΣ  ΜΑΚΕΔΟΝΙΑΣ ΚΑΙ ΘΡΑΚΗΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'11', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΚΕΝΤΡΙΚΗΣ ΕΛΛΑΔΑΣ ΚΑΙ ΗΠΕΙΡΟΥ', N'931', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΚΕΝΤΡΙΚΗΣ ΕΛΛΑΔΟΣ ΚΑΙ ΗΠΕΙΡΟΥ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'14', N'Δ/ΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ', N'9249', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'15', N'Δ/ΝΣΗ ΝΑΥΤΙΛΙΑΚΩΝ ΕΡΓΑΣΙΩΝ', N'9248', N'ΔΙΕΥΘΥΝΣΗ ΝΑΥΤΙΛΙΑΚΩΝ ΕΡΓΑΣΙΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'16', N'ABC FACTORS', N'2001', N'ABC FACTORS ΠΡΑΚΤΟΡΕΙΑ ΕΠΙΧΕΙΡΗΜΑΤΙΚΩΝ ΑΠΑΙΤΗΣΕΩΝ A.E.')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'17', N'Δ/ΝΣΗ PRIVATE BANKING', N'950', N'ΔΙΕΥΘΥΝΣΗ PRIVATE BANKING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'18', N'Δ/ΝΣΗ ΠΩΛΗΣΕΩΝ ΧΡΗΜΑΤΟΟΙΚ.ΠΡΟΪΟΝΤΩΝ', N'9160', N'ΔΙΕΥΘΥΝΣΗ ΠΩΛΗΣΕΩΝ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΩΝ ΠΡΟΙΟΝΤΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'20', N'Δ/ΝΣΗ ΧΡΗΜ/ΣΕΩΝ ΤΟΥΡΙΣΤΙΚΩΝ & ΝΗΣΙΩΤΙΚΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ', N'933', N'ΔΙΕΥΘΥΝΣΗ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ ΤΟΥΡΙΣΤΙΚΩΝ ΚΑΙ ΝΗΣΙΩΤΙΚΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'21', N'Δ/ΝΣΗ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ ΔΙΑΧΕΙΡΙΣΕΩΣ', N'9161', N'ΔΙΕΥΘΥΝΣΗ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ ΔΙΑΧΕΙΡΙΣΕΩΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'22', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ', N'941', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'23', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ, ΠΕΛΟΠΟΝΝΗΣΟΥ ΚΑΙ ΔΥΤΙΚΗΣ ΣΤΕΡΕΑΣ ΕΛΛΑΔΟΣ',	N'932',	N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ, ΠΕΛΟΠΟΝΝΗΣΟΥ ΚΑΙ ΔΥΤΙΚΗΣ ΣΤΕΡΕΑΣ ΕΛΛΑΔΟΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'24', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΚΕΝΤΡΙΚΗΣ ΚΑΙ ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ', N'925', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΚΕΝΤΡΙΚΗΣ ΚΑΙ ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'25', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ–W', N'9411', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΩΝ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ - W')
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
