CLASS zcl_composite DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_component.
    METHODS constructor IMPORTING name TYPE char20.
    METHODS add_component IMPORTING im_component TYPE REF TO zif_component.
    ALIASES name FOR zif_component~name.
    ALIASES get_price FOR zif_component~get_price.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA components TYPE STANDARD TABLE OF REF TO zif_component.


ENDCLASS.



CLASS zcl_composite IMPLEMENTATION.


  METHOD add_component.
    APPEND im_component TO components.
  ENDMETHOD.

  METHOD constructor.

    me->name = name.

  ENDMETHOD.



  METHOD zif_component~get_price.
    LOOP AT components INTO DATA(component).
      price +=  component->get_price( ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
