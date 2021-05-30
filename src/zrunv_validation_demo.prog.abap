*&---------------------------------------------------------------------*
*& Report ZRUNV_INN_VALIDATION_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrunv_validation_demo.

START-OF-SELECTION.

* INN(TIN)
  IF NEW zcl_runv_inn_number( `500100732259` )->is_valid( ).
    WRITE `INN: True`.
  ELSE.
    WRITE `INN: False`.
  ENDIF.


* SNILS
  TRY.
      IF NEW zcl_runv_snils_number( `112-233-445 95` )->is_valid( ).
        WRITE `SNILS: True`.
      ELSE.
        WRITE `SNILS: False`.
      ENDIF.

    CATCH zcx_runv_exception INTO DATA(lx_e).
      WRITE |`SNILS: False ` { lx_e->get_text( ) }|.
  ENDTRY.
