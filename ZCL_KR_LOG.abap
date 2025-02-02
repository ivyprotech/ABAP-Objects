class ZCL_KR_LOG definition
  public
  final
  create private .

public section.
  TYPES : BEGIN OF ty_log,
            time TYPE sy-uzeit,
            text TYPE string,
           END OF ty_log.
  TYPES : tt_log TYPE STANDARD TABLE OF ty_log.
  data IT_LOG type TT_LOG .

  methods WRITE_TO_LOG
    importing
      time type sy-uzeit
      text type string .
  methods READ_LOG .
  class-methods get_instance
    RETURNING VALUE(r_log)
      type ref to ZCL_KR_LOG .
protected section.
private section.

  class-data O_LOG type ref to ZCL_KR_LOG .
ENDCLASS.



CLASS ZCL_KR_LOG IMPLEMENTATION.


  method get_instance.
    IF o_log IS NOT BOUND.
      create object o_log.
    ENDIF.
    r_log = o_log.
  endmethod.


  method READ_LOG.
     LOOP AT IT_LOG INTO DATA(st_log).
      WRITE: / 'Time:', st_log-time, 'Text:', st_log-text.
    ENDLOOP.
  endmethod.


  method WRITE_TO_LOG.
    data: st_log type ty_log.
    st_log-time = time.
    st_log-text = text.
    append st_log to it_log.
  endmethod.
ENDCLASS.
