CLASS zcl_model_matdata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES tr_matnr TYPE RANGE OF matnr.
  DATA makt TYPE STANDARD TABLE OF makt.
  METHODS get_material_data IMPORTING rt_material TYPE tr_matnr.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_model_matdata IMPLEMENTATION.
  METHOD get_material_data.
    SELECT * FROM makt INTO TABLE @makt WHERE matnr IN @rt_material AND spras EQ @sy-langu.
  ENDMETHOD.

ENDCLASS.
