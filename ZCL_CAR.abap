class ZCL_CAR definition
  public
  inheriting from ZCL_VEHICLE
  final
  create public .

public section.

  interfaces ZIF_VEHICLE .

  aliases GET_MIL
    for ZIF_VEHICLE~GET_MILAGE .

  events REG_EXPIRED .

  methods GET_SEATS .
  methods ANOUNCE_EXPIRY .

  methods CAL_MILEAGE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CAR IMPLEMENTATION.


  method ANOUNCE_EXPIRY.
    RAISE EVENT REG_EXPIRED.
  endmethod.


  method CAL_MILEAGE.
*CALL METHOD SUPER->CAL_MILEAGE
*  RECEIVING
*    MILEAGE =
*    .
    mileage = 10.
  endmethod.


  method GET_SEATS.
    "This is car
  endmethod.


  method ZIF_VEHICLE~GET_MILAGE.
    "This is from interace
  endmethod.
ENDCLASS.
