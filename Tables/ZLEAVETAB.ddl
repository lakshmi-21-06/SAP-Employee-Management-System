@EndUserText.label : 'Employee Leave Details'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zleavetab {
  key client       : abap.clnt not null;
  key mandt        : abap.clnt not null;
  key leave_id     : abap.char(10) not null;

  emp_id           : abap.char(10);
  leave_type       : abap.char(20);
  from_date        : abap.dats;
  to_date          : abap.dats;
  status           : abap.char(15);
}
