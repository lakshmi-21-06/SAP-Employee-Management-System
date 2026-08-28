@EndUserText.label : 'Employee table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zemployeetab {
  key client       : abap.clnt not null;
  key mandt        : abap.clnt not null;
  key emp_id       : abap.char(10) not null;

  emp_name         : abap.char(40);
  department       : abap.char(30);
  designation      : abap.char(40);
  join_date        : abap.dats;
}
