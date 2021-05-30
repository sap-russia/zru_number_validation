
CLASS ltc_runv_inn DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  FINAL.

  PRIVATE SECTION.
    METHODS:
      is_valid FOR TESTING
        RAISING zcx_runv_exception.
ENDCLASS.       "ltc_Runv_Inn


CLASS ltc_runv_inn IMPLEMENTATION.

  METHOD is_valid.

*   length 10
    DATA(lv_val) = NEW zcl_runv_inn_number( `7830002293` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_true
                                        msg = 'Testing is_valid meth, length 10' ).

*   length 12
    lv_val = NEW zcl_runv_inn_number( `500100732259` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_true
                                        msg = 'Testing is_valid meth, length 12' ).

*   other length
    lv_val = NEW zcl_runv_inn_number( `1234` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_false
                                        msg = 'Testing is_valid meth, other length' ).

*   inn with char (not valid)
    lv_val = NEW zcl_runv_inn_number( `test1234` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_false
                                        msg = 'Testing is_valid meth, inn with char'  ).

  ENDMETHOD.

ENDCLASS.
