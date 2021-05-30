*&---------------------------------------------------------------------*
*& Report ZRUNV_INN_VALIDATION_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrunv_validation_demo.

START-OF-SELECTION.

* ИНН
  IF NEW zcl_runv_inn_number( `500100732259` )->is_valid( ).
    WRITE `ИНН: True`.
  ELSE.
    WRITE `ИНН: False`.
  ENDIF.


* СНИЛС
  TRY.
      IF NEW zcl_runv_snils_number( `112-233-445 95` )->is_valid( ).
        WRITE `СНИЛС: True`.
      ELSE.
        WRITE `СНИЛС: False`.
      ENDIF.

    CATCH zcx_runv_exception INTO DATA(lx_e).
      WRITE |`СНИЛС: False ` { lx_e->get_text( ) }|.
  ENDTRY.
