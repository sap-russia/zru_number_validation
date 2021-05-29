class ZCL_RUNV_INN_NUMBER definition
  public
  create public .

public section.

  types:
    ty_t_coefficients TYPE STANDARD TABLE OF i WITH DEFAULT KEY .

  methods CONSTRUCTOR
    importing
      !IV_NUMBER type STRING
    raising
      ZCX_RUNV_EXCEPTION .
  methods IS_VALID
    returning
      value(RV_VAL) type BOOLE_D .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_number TYPE string .
    DATA mv_number_len TYPE i .

    METHODS control_number
      IMPORTING
        !it_coefficients TYPE ty_t_coefficients
      RETURNING
        VALUE(rv_val)    TYPE i .
ENDCLASS.



CLASS ZCL_RUNV_INN_NUMBER IMPLEMENTATION.


  METHOD constructor.

    mv_number = iv_number.
    CONDENSE mv_number.

    IF mv_number CN '0123456789'.
      MESSAGE e001(zruvn) INTO DATA(lv_message).

      RAISE EXCEPTION TYPE zcx_runv_exception
        EXPORTING
          textid = VALUE #( msgid = 'ZRUVN'
                            msgno = 001 ).
    ENDIF.

    mv_number_len = strlen( mv_number ).

    IF mv_number_len <> 10 AND mv_number_len <> 12.

      MESSAGE e002(zruvn) INTO lv_message.

      RAISE EXCEPTION TYPE zcx_runv_exception
        EXPORTING
          textid = VALUE #( msgid = 'ZRUVN'
                            msgno = 002 ).
    ENDIF.

  ENDMETHOD.


  METHOD control_number.

    rv_val = REDUCE i(
               INIT n = 0
               FOR coef IN it_coefficients
               INDEX INTO lv_idx
               LET lv_pos = lv_idx - 1
               IN NEXT n = n + coef * mv_number+lv_pos(1) ).

    rv_val = ( ( rv_val MOD 11 ) MOD 10 ).

  ENDMETHOD.


  METHOD is_valid.

    CASE mv_number_len.
      WHEN 10.

        DATA(lv_n10) = substring( val = mv_number
                                  off = strlen( mv_number ) - 1
                                  len = 1 ).

        DATA(lt_coefficients_10) = VALUE ty_t_coefficients( ( 2 ) ( 4 ) ( 10 ) ( 3 ) ( 5 ) ( 9 ) ( 4 ) ( 6 ) ( 8 ) ).

        IF lv_n10 = control_number( lt_coefficients_10 ).
          rv_val = abap_true.
        ENDIF.

      WHEN 12.

        DATA(lv_n11) = substring( val = mv_number
                                  off = strlen( mv_number ) - 2
                                  len = 1 ).

        DATA(lv_n12) = substring( val = mv_number
                                  off = strlen( mv_number ) - 1
                                  len = 1 ).

        DATA(lt_coefficients_11) = VALUE ty_t_coefficients( ( 7 ) ( 2 ) ( 4 ) ( 10 ) ( 3 ) ( 5 ) ( 9 ) ( 4 ) ( 6 ) ( 8 ) ).
        DATA(lt_coefficients_12) = VALUE ty_t_coefficients( ( 3 ) ( 7 ) ( 2 ) ( 4 ) ( 10 ) ( 3 ) ( 5 ) ( 9 ) ( 4 ) ( 6 ) ( 8 ) ).

        IF lv_n11 = control_number( lt_coefficients_11 ) AND lv_n12 = control_number( lt_coefficients_12 ).
          rv_val = abap_true.
        ENDIF.

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
