Τα scripts θα χρειαστεί να εκτελεστούν στην παραγωγή με την παρακάτω σειρά:

Tenant Database
1.	Tenant_View_esgassessment_esgquestion_esgoverallassessment.sql

Olap Database (! Προσοχή η εκτέλεση πρέπει να γίνει με Olap User)
2.	Olap_Functionality.sql
3.	Lookup_Tables.sql
4.	Create_Table_Olap_ESGReport_ESGOverallassessment.sql
5.	Function_ESGReport.sql
6.	Function_ESGOverallassessment.sql
7.	View_ESGReport_ESGOverallAssessment.sql
Τέλος θα χρειαστεί να τρέξει time series job προκειμένου να κατέβουν τα data από tenant σε olap. 
