*&---------------------------------------------------------------------*
*& Report ZRUNV_INN_VALIDATION_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrunv_inn_validation_demo.

START-OF-SELECTION.

  TRY.
      IF NEW zcl_runv_inn_number( `500100732259` )->is_valid( ).
*       Do anything...
        WRITE 'Ok'.
      ENDIF.

    CATCH zcx_runv_exception INTO DATA(lx_e).
      WRITE lx_e->get_text( ).
  ENDTRY.
