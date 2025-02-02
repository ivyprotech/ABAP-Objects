CLASS zcl_clone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA : doc_type TYPE c,
         payment_terms TYPE char5.
  METHODS post_doc.
  METHODS constructor IMPORTING doc_type TYPE c
                                payment_terms TYPE char5.

  METHODS clone RETURNING VALUE(o_doc) TYPE REF TO zcl_clone.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clone IMPLEMENTATION.
  METHOD post_doc.

  ENDMETHOD.

  METHOD constructor.
    me->doc_type = doc_type.
    me->payment_terms = payment_terms.
  ENDMETHOD.

  METHOD clone.
    o_doc = NEW #( doc_type = doc_type payment_terms = payment_terms ).
  ENDMETHOD.

ENDCLASS.
