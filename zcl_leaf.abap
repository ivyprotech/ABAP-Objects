CLASS zcl_leaf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_component.
    METHODS constructor IMPORTING name  TYPE char10
                                  price TYPE netwr.
    ALIASES: name FOR zif_component~name,
             get_price FOR zif_component~get_price.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA price TYPE netwr.
ENDCLASS.



CLASS zcl_leaf IMPLEMENTATION.


  METHOD constructor.
    me->name = name.
    me->price = price.
  ENDMETHOD.

  METHOD zif_component~get_price.
        price = me->price.
  ENDMETHOD.

ENDCLASS.
