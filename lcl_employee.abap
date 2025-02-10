CLASS lcl_employee DEFINITION.
  PUBLIC SECTION.
  CLASS-DATA date TYPE d.
  METHODS constructor IMPORTING emp_id TYPE char10.
  METHODS get_salary  EXPORTING salary TYPE i.
  METHODS get_leaves  EXPORTING leaves TYPE i.
  PROTECTED SECTION.

  PRIVATE SECTION.
  DATA emp_id TYPE char10.
  DATA salary TYPE i.
  DATA leaves TYPE i.
ENDCLASS.
CLASS lcl_employee IMPLEMENTATION.
  METHOD get_salary.
    salary = me->salary.
  ENDMETHOD.
  METHOD get_leaves.
    leaves = me->leaves.
  ENDMETHOD.
  METHOD constructor.
    me->emp_id = emp_id.
    salary = 100.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
lcl_employee=>date = sy-datum.
DATA(o_mark) = NEW lcl_employee( emp_id = '1122'  ).

o_mark->get_salary(
  IMPORTING
    salary = DATA(v_salary)
).

WRITE v_salary.
