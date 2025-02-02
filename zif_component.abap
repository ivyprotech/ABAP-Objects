INTERFACE zif_component
  PUBLIC .
    DATA name TYPE char20.
    METHODS get_price RETURNING VALUE(price) TYPE netwr.
ENDINTERFACE.
