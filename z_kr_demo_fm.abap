FUNCTION z_kr_demo_fm
  IMPORTING
    im_matnr TYPE matnr
  EXPORTING
    st_makt TYPE makt
  RAISING
    zcx_no_material.



**********************************************************************
*Below Example shows raising custom exception class.
**********************************************************************
  SELECT SINGLE * FROM makt INTO st_makt WHERE matnr EQ im_matnr.
  IF sy-subrc IS NOT INITIAL.
    RAISE EXCEPTION TYPE zcx_no_material
      EXPORTING
        textid = zcx_no_material=>zcx_no_material
        mat_no = im_matnr.
  ENDIF.
**********************************************************************
*Below example shows catching a standard exception class.
**********************************************************************

  DATA : quantity   TYPE i,
         total      TYPE i VALUE 5,
         unit_price TYPE i.

  TRY.
      unit_price = total / quantity.
    CATCH cx_sy_zerodivide INTO DATA(r_er).
      WRITE : / r_er->get_text( ).
      WRITE : / r_er->get_longtext( ).
    CLEANUP.

  ENDTRY.
ENDFUNCTION.
