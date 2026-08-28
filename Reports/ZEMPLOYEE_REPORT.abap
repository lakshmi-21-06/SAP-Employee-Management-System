REPORT zemployee_report.

PARAMETERS:
  p_create AS CHECKBOX DEFAULT ' ',
  p_leave  AS CHECKBOX DEFAULT ' ',
  p_attend AS CHECKBOX DEFAULT ' '.

SELECTION-SCREEN SKIP.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

PARAMETERS:
  p_empid TYPE zemployeetab-emp_id,
  p_name  TYPE zemployeetab-emp_name,
  p_dept  TYPE zemployeetab-department,
  p_desig TYPE zemployeetab-designation,
  p_date  TYPE zemployeetab-join_date.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME.

PARAMETERS:
  p_lvid   TYPE zleavetab-leave_id,
  p_ltype  TYPE zleavetab-leave_type,
  p_from   TYPE zleavetab-from_date,
  p_to     TYPE zleavetab-to_date.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME.

PARAMETERS:
  p_att_dt TYPE zattendancetab-att_date.

PARAMETERS:
  p_pres RADIOBUTTON GROUP  stat DEFAULT 'X',
  p_abs  RADIOBUTTON GROUP stat.

SELECTION-SCREEN END OF BLOCK b3.


DATA:
  lo_manager  TYPE REF TO zcl_employee_manager,
  lt_employee TYPE zcl_employee_manager=>tt_employee.


AT SELECTION-SCREEN.

  IF p_empid IS NOT INITIAL
     AND p_create IS INITIAL.

    SELECT SINGLE
      emp_name,
      department,
      designation,
      join_date
      FROM zemployeetab
      WHERE emp_id = @p_empid
      INTO (@p_name,
            @p_dept,
            @p_desig,
            @p_date).

    IF sy-subrc <> 0.

      CLEAR:
        p_name,
        p_dept,
        p_desig,
        p_date.

      MESSAGE 'Employee ID not found' TYPE 'E'.

    ENDIF.

  ENDIF.

START-OF-SELECTION.

  CREATE OBJECT lo_manager.


  IF p_create = 'X'.

    DATA lv_emp_success TYPE abap_boolean.

    lv_emp_success = lo_manager->create_employee(
      iv_emp_id      = p_empid
      iv_emp_name    = p_name
      iv_department  = p_dept
      iv_designation = p_desig
      iv_join_date   = p_date ).

    IF lv_emp_success = abap_true.

      WRITE: / 'Employee created successfully!'.

    ELSE.

      WRITE: / 'Employee creation failed.'.

    ENDIF.


  ELSEIF p_leave = 'X'.

    DATA lv_leave_success TYPE abap_boolean.

    lv_leave_success = lo_manager->create_leave(
      iv_leave_id   = p_lvid
      iv_emp_id     = p_empid
      iv_leave_type = p_ltype
      iv_from_date  = p_from
      iv_to_date    = p_to
      iv_status     = 'Pending' ).

    IF lv_leave_success = abap_true.

      WRITE: / 'Leave request created successfully!'.

    ELSE.

      WRITE: / 'Leave request creation failed.'.

    ENDIF.


  ELSEIF p_attend = 'X'.

    DATA lv_att_status TYPE zattendancetab-status.

    DATA lv_att_success TYPE abap_boolean.

    IF p_pres = 'X'.

      lv_att_status = 'Present'.

    ELSE.

      lv_att_status = 'Absent'.

    ENDIF.

    lv_att_success = lo_manager->create_attendance(
      iv_emp_id   = p_empid
      iv_att_date = p_att_dt
      iv_status   = lv_att_status ).

    IF lv_att_success = abap_true.

      WRITE: / 'Attendance recorded successfully!',
             / 'Employee ID :', p_empid,
             / 'Date        :', p_att_dt,
             / 'Status      :', lv_att_status.

    ELSE.

      WRITE: / 'Attendance recording failed.'.

    ENDIF.


  ELSE.

    lt_employee = lo_manager->get_employees( ).

    LOOP AT lt_employee INTO DATA(ls_employee).

      WRITE: / 'Employee ID :', ls_employee-emp_id,
             / 'Name        :', ls_employee-emp_name,
             / 'Department  :', ls_employee-department,
             / 'Designation :', ls_employee-designation,
             / 'Join Date   :', ls_employee-join_date,
             / '----------------------------------------'.

    ENDLOOP.

  ENDIF.
