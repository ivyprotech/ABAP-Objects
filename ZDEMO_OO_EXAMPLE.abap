*&---------------------------------------------------------------------*
*& Report ZDEMO_OO_EXAMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDEMO_OO_EXAMPLE.
CLASS lcl_event DEFINITION.
  PUBLIC SECTION.
  METHODS double_click FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE IMPORTING row column.
ENDCLASS.
CLASS lcl_event IMPLEMENTATION.
  METHOD double_click.
    write 'abc'.
  ENDMETHOD.
ENDCLASS.
PARAMETERS p_matnr TYPE makt-matnr.
START-OF-SELECTION.
SELECT * FROM makt INTO TABLE @DATA(it_makt) WHERE matnr EQ @p_matnr.

CL_salv_table=>factory(
*  EXPORTING
*    list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
*    r_container    =                           " Abstract Container for GUI Controls
*    container_name =
  IMPORTING
    r_salv_table   =    DATA(o_alv)                       " Basis Class Simple ALV Tables
  CHANGING
    t_table        = it_makt
).
*CATCH cx_salv_msg. " ALV: General Error Class with Message

DATA(o_event_alv) = o_alv->get_event( ).
DATA(o_event) = NEW lcl_event( ).

SET HANDLER o_event->double_click FOR o_event_alv.
  o_alv->display( ).
