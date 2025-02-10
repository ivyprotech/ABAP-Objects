class ZCL_TRANSPORT1 definition
  public
  final
  create public .

public section.

  methods PROCESS_VEHICLE
    importing
      !IM_VEHICLE type ref to ZCL_VEHICLE .
protected section.
private section.
ENDCLASS.



CLASS ZCL_TRANSPORT1 IMPLEMENTATION.


  method PROCESS_VEHICLE.
    DATA o_car TYPE REF To zcl_car.
    DATA(mileage) = im_vehicle->cal_mileage( ).
    IF im_vehicle->type EQ 'CAR'.
      o_car ?= im_vehicle.
      o_car->get_seats( ).
    ENDIF.
    WRITE mileage.


  endmethod.
ENDCLASS.
