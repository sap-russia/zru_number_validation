CLASS zcl_runv_snils_number DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !iv_number TYPE string
      RAISING
        zcx_runv_exception .
    METHODS is_valid
      RETURNING
        VALUE(rv_val) TYPE boole_d .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_number TYPE string .
    DATA mv_number_len TYPE i .

    METHODS control_number
      RETURNING
        VALUE(rv_val)    TYPE i .
ENDCLASS.



CLASS ZCL_RUNV_SNILS_NUMBER IMPLEMENTATION.


  METHOD constructor.

    mv_number = iv_number.

    mv_number = replace( val = mv_number
                         sub  = ` `
                         with = ``
                         occ = 0 ).

    mv_number = replace( val = mv_number
                         sub  = `-`
                         with = ``
                         occ = 0 ).

    mv_number_len = strlen( mv_number ).
    DATA(lv_number) = mv_number(9).
    SHIFT lv_number LEFT DELETING LEADING `0`.

    IF CONV i( lv_number ) <= 1001998.
      MESSAGE e001(zruvn) INTO DATA(lv_message).

      RAISE EXCEPTION TYPE zcx_runv_exception
        EXPORTING
          textid = VALUE #( msgid = 'ZRUVN'
                            msgno = 001 ).
    ENDIF.

  ENDMETHOD.


  METHOD control_number.

    rv_val = REDUCE i( INIT n = 0
                       FOR i = 9 THEN i - 1 WHILE i > 0
                       LET j = abs( i - 9 ) IN
                       NEXT n = n + i * mv_number+j(1) ).

    rv_val = ( ( rv_val MOD 101 ) MOD 100 ).

  ENDMETHOD.


  METHOD is_valid.

    IF mv_number CN '0123456789'.
      RETURN.
    ENDIF.

    IF mv_number_len <> 11.
      RETURN.
    ENDIF.

    DATA(lv_n) = CONV i( substring( val = mv_number
                                    off = mv_number_len - 2
                                    len = 2 ) ).

    IF lv_n = control_number( ).
      rv_val = abap_true.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
