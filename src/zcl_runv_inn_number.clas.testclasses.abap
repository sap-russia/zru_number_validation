
CLASS ltc_runv_inn DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

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
    TRY.
        lv_val = NEW zcl_runv_inn_number( `1234` )->is_valid( ).
        cl_abap_unit_assert=>fail( msg = 'Testing is_valid meth, other length' ).

      CATCH zcx_runv_exception INTO DATA(lx_e).
    ENDTRY.

*   inn with test (not valid)
    TRY.
        lv_val = NEW zcl_runv_inn_number( `test1234` )->is_valid( ).
        cl_abap_unit_assert=>fail( msg = 'Testing is_valid meth, inn with test' ).

      CATCH zcx_runv_exception INTO lx_e.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
