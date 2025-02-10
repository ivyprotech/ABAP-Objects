class ZCL_VEHICLE definition
  public
  abstract
  create public .

public section.

  data TYPE type CHAR10 .
  data REG_NUM type CHAR10 .

  methods CAL_MILEAGE
    returning
      value(MILEAGE) type I .
protected section.
private section.
ENDCLASS.



CLASS ZCL_VEHICLE IMPLEMENTATION.


  method CAL_MILEAGE.
    "This is super class
  endmethod.
ENDCLASS.
