@EndUserText.label : 'Employee Attendance Details'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zattendancetab {
  key client       : abap.clnt not null;
  key mandt        : abap.clnt not null;
  key emp_id       : abap.char(10) not null;
  key att_date     : abap.dats not null;

  status           : abap.char(10);
}
