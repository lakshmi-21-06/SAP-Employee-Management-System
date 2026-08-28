CLASS zcl_employee_manager DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      tt_employee TYPE STANDARD TABLE OF zemployeetab
        WITH EMPTY KEY.

    METHODS get_employees
      RETURNING VALUE(rt_employees) TYPE tt_employee.

    METHODS get_employee_by_id
      IMPORTING
        iv_emp_id TYPE zemployeetab-emp_id
      RETURNING
        VALUE(rs_employee) TYPE zemployeetab.
     METHODS create_employee
  IMPORTING
    iv_emp_id      TYPE zemployeetab-emp_id
    iv_emp_name    TYPE zemployeetab-emp_name
    iv_department  TYPE zemployeetab-department
    iv_designation TYPE zemployeetab-designation
    iv_join_date   TYPE zemployeetab-join_date
  RETURNING
    VALUE(rv_success) TYPE abap_boolean.
  METHODS create_leave
  IMPORTING
    iv_leave_id   TYPE zleavetab-leave_id
    iv_emp_id     TYPE zleavetab-emp_id
    iv_leave_type TYPE zleavetab-leave_type
    iv_from_date  TYPE zleavetab-from_date
    iv_to_date    TYPE zleavetab-to_date
    iv_status     TYPE zleavetab-status
  RETURNING
    VALUE(rv_success) TYPE abap_boolean.

  METHODS create_attendance
  IMPORTING
    iv_emp_id  TYPE zattendancetab-emp_id
    iv_att_date TYPE zattendancetab-att_date
    iv_status   TYPE zattendancetab-status
  RETURNING
    VALUE(rv_success) TYPE abap_boolean.
ENDCLASS.


CLASS zcl_employee_manager IMPLEMENTATION.

  METHOD get_employees.

    SELECT *
      FROM zemployeetab
      INTO TABLE @rt_employees.

  ENDMETHOD.


  METHOD get_employee_by_id.

    SELECT SINGLE *
      FROM zemployeetab
      WHERE emp_id = @iv_emp_id
      INTO @rs_employee.

  ENDMETHOD.
  METHOD create_employee.

  DATA ls_employee TYPE zemployeetab.

  ls_employee-emp_id      = iv_emp_id.
  ls_employee-emp_name    = iv_emp_name.
  ls_employee-department  = iv_department.
  ls_employee-designation = iv_designation.
  ls_employee-join_date   = iv_join_date.

  INSERT zemployeetab FROM @ls_employee.

  IF sy-subrc = 0.
    rv_success = abap_true.
  ELSE.
    rv_success = abap_false.
  ENDIF.

ENDMETHOD.

  METHOD create_leave.

  DATA ls_leave TYPE zleavetab.

  ls_leave-leave_id   = iv_leave_id.
  ls_leave-emp_id     = iv_emp_id.
  ls_leave-leave_type = iv_leave_type.
  ls_leave-from_date  = iv_from_date.
  ls_leave-to_date    = iv_to_date.
  ls_leave-status     = iv_status.

  INSERT zleavetab FROM @ls_leave.

  IF sy-subrc = 0.
    rv_success = abap_true.
  ELSE.
    rv_success = abap_false.
  ENDIF.

ENDMETHOD.

METHOD create_attendance.

  DATA ls_attendance TYPE zattendancetab.

  ls_attendance-emp_id   = iv_emp_id.
  ls_attendance-att_date = iv_att_date.
  ls_attendance-status   = iv_status.

  INSERT zattendancetab FROM @ls_attendance.

  IF sy-subrc = 0.
    rv_success = abap_true.
  ELSE.
    rv_success = abap_false.
  ENDIF.

ENDMETHOD.

ENDCLASS.
