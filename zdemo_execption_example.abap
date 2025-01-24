*&---------------------------------------------------------------------*
*& Report ZDEMO_EXCEPTION_EXAMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_procedure_example1.
PARAMETERS p_matnr TYPE matnr.
DATA st_makt TYPE makt.

TRY.
    CALL FUNCTION 'Z_KR_DEMO_FM'
      EXPORTING
        im_matnr = p_matnr
      IMPORTING
        st_makt  = st_makt.
  CATCH zcx_no_material INTO DATA(r_er).
    WRITE : / r_er->get_text( ).
    WRITE : / r_er->get_longtext( ).
ENDTRY.


WRITE : / st_makt-matnr, st_makt-spras, st_makt-maktx.
