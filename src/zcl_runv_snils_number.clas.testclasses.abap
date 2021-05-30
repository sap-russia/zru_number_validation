
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
                                        msg = 'Testing is_valid meth, other length'  ).

*   inn with test (not valid)
    lv_val = NEW zcl_runv_inn_number( `test1234` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                exp = abap_false
                                msg = 'Testing is_valid meth, inn with test' ).
  ENDMETHOD.

ENDCLASS.

CLASS ltc_runv_snils DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    METHODS: is_valid FOR TESTING.
ENDCLASS.       "ltc_Runv_Snils


CLASS ltc_runv_snils IMPLEMENTATION.

  METHOD is_valid.

*   whith `-`
    DATA(lv_val) = NEW zcl_runv_snils_number( `112-233-445 95` )->is_valid( ).

    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_true
                                        msg = 'Testing is_valid meth, whith -' ).

*   whithout `-`
    lv_val = NEW zcl_runv_snils_number( `11223344595` )->is_valid( ).
    cl_abap_unit_assert=>assert_equals( act = lv_val
                                        exp = abap_true
                                        msg = 'Testing is_valid meth, whithout -' ).
*  less 1001998 whith `-`
    TRY.
        lv_val = NEW zcl_runv_snils_number( `001-001-998` )->is_valid( ).
        cl_abap_unit_assert=>fail( msg = 'Testing is_valid meth, less 1001998 whith -' ).

      CATCH zcx_runv_exception INTO DATA(lx_e).
    ENDTRY.

*  less 1001998 whithout `-`
    TRY.
        lv_val = NEW zcl_runv_snils_number( `001001998` )->is_valid( ).
        cl_abap_unit_assert=>fail( msg = 'Testing is_valid meth, less 1001998 whithout -' ).

      CATCH zcx_runv_exception INTO lx_e.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
