@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee CDS View'

define view entity ZC_EMPLOYEE
  as select from zemployeetab
{
  key emp_id,
      emp_name,
      department,
      designation,
      join_date
}
