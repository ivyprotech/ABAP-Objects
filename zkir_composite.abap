*&---------------------------------------------------------------------*
*& Report zkir_composite
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkir_composite.

DATA(o_iphone) = NEW zcl_kir_leaf(
  name  = 'Iphone'
  price = 599
).

DATA(o_charger) = NEW zcl_kir_leaf(
  name  = 'Charger'
  price = 99
).

DATA(o_cable) = NEW zcl_kir_leaf(
  name  = 'Cable'
  price = 9
).

DATA(o_ipad) = NEW zcl_kir_leaf(
  name  = 'Ipad'
  price = 999
).

DATA(o_iphone_box) = NEW zcl_kir_composite( name = 'Iphone Box' ).
DATA(o_charger_box) = NEW zcl_kir_composite( name = 'Charger Box' ).
DATA(o_ipad_box) = NEW zcl_kir_composite( name = 'Ipad Box' ).
DATA(o_SHIPPING_box) = NEW zcl_kir_composite( name = 'Shipping Box' ).


o_charger_box->add_component( im_component = o_charger ).
o_charger_box->add_component( im_component = o_cable ).

o_iphone_box->add_component( im_component = o_iphone ).
o_iphone_box->add_component( im_component = o_charger_box ).

o_ipad_box->add_component( im_component = o_ipad ).

o_shipping_box->add_component( im_component = o_iphone_box ).
o_shipping_box->add_component( im_component = o_ipad_box ).

WRITE : / 'Total Shipping Box Price: ', o_shipping_box->get_price( ).
WRITE : / 'Total Iphone Box Price: ', o_iphone_box->get_price( ).
WRITE : / 'Iphone Price: ', o_iphone->get_price( ).
