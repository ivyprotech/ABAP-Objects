*&---------------------------------------------------------------------*
*& Report zkr_demo_mvc_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkr_demo_mvc_report.

CONSTANTS model_name TYPE char30 VALUE 'ZCL_MODEL_MATDATA'.
DATA v_matnr TYPE matnr.
SELECT-OPTIONS s_matnr FOR v_matnr.

**********************************************************************
*Controller
**********************************************************************
TRY.
    DATA(controller) = NEW zcl_controller(  ).
  CATCH cx_sy_create_object_error INTO DATA(object_error).
    MESSAGE |{ object_error->get_text( ) }| TYPE 'E'.
ENDTRY.
TRY.
    controller->get_object(
      EXPORTING
        name = model_name ).
  CATCH cx_method_not_implemented INTO DATA(control_method_error).
    MESSAGE |{ control_method_error->get_text( ) }| TYPE 'E'.
ENDTRY.

TRY.
    controller->model->get_material_data( rt_material = s_matnr[] ).

  CATCH cx_method_not_implemented INTO DATA(model_method_error).
    MESSAGE |{ model_method_error->get_text( ) }| TYPE 'E'.
ENDTRY.

**********************************************************************
*VIEW
**********************************************************************
TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = DATA(alv)
      CHANGING
        t_table      = controller->model->makt ).
  CATCH cx_salv_msg INTO DATA(alv_error).
    MESSAGE |{ alv_error->get_text( ) }| TYPE 'E'.
ENDTRY.

alv->display( ).
