@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Leave CDS View'

define view entity ZC_LEAVE
  as select from zleavetab
{
  key leave_id,
      emp_id,
      leave_type,
      from_date,
      to_date,
      status
}
