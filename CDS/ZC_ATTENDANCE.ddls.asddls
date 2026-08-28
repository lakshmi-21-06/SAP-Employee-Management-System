@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Attendance CDS View'

define view entity ZC_ATTENDANCE
  as select from zattendancetab
{
  key emp_id,
  key att_date,
      status
}
