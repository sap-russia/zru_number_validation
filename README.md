[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/victorizbitskiy/zru_number_validation/blob/main/LICENSE)
![ABAP 7.52+](https://img.shields.io/badge/ABAP-7.52%2B-brightgreen)

**ВНИМАНИЕ**: Проект еще разрабатывается и может меняться.  

## `Валидация номеров российских документов`

* [ИНН](https://ru.wikipedia.org/wiki/%D0%98%D0%B4%D0%B5%D0%BD%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B9_%D0%BD%D0%BE%D0%BC%D0%B5%D1%80_%D0%BD%D0%B0%D0%BB%D0%BE%D0%B3%D0%BE%D0%BF%D0%BB%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D1%89%D0%B8%D0%BA%D0%B0)
* [СНИЛС](https://ru.wikipedia.org/wiki/%D0%A1%D1%82%D1%80%D0%B0%D1%85%D0%BE%D0%B2%D0%BE%D0%B9_%D0%BD%D0%BE%D0%BC%D0%B5%D1%80_%D0%B8%D0%BD%D0%B4%D0%B8%D0%B2%D0%B8%D0%B4%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B3%D0%BE_%D0%BB%D0%B8%D1%86%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE_%D1%81%D1%87%D1%91%D1%82%D0%B0)  

# Оглавление
1. [Установка](#Установка)
2. [Использование](#Использование)

## Установка
Установка выполняется с помощью [abapGit](http://www.abapgit.org).

## Использование
<details open>
<base target="_blank">
<summary>Пример</summary>
   
```abap
* INN (TIN)
  IF NEW zcl_runv_inn_number( `500100732259` )->is_valid( ).
*   Do anything...
  ENDIF.

* SNILS
  TRY.
      IF NEW zcl_runv_snils_number( `112-233-445 95` )->is_valid( ).
*       Do anything...
      ENDIF.

    CATCH zcx_runv_exception INTO DATA(lx_e).
      WRITE |`SNILS: False ` { lx_e->get_text( ) }|.
  ENDTRY.
```
</details>
