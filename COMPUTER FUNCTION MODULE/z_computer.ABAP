REPORT zbc400_00_ka_function_module.

TYPES: tv_result TYPE p LENGTH 16 DECIMALS 2.

DATA: v_result TYPE p LENGTH 16 DECIMALS 2.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i,
            p_oper TYPE c LENGTH 1.

CASE p_oper.
  WHEN 'P'.
    CALL FUNCTION 'BC400_MOS_POWER'
      EXPORTING
        iv_base               = p_num1
        iv_power              = p_num2
      IMPORTING
        ev_result             = v_result
      EXCEPTIONS
        power_value_too_high  = 1
        result_value_too_high = 2
        OTHERS                = 3.

    CASE SY-SUBRC.
      WHEN 0.

      WHEN 1.
        MESSAGE 'EXPOENTE MAIOR QUE 4' TYPE 'I'.
        STOP.

      WHEN 2.
        MESSAGE 'RESULTADO INVÁLIDO' TYPE 'I'.
        STOP.

      WHEN OTHERS.
        MESSAGE 'ERRO DESCONHECIDO' TYPE 'I'.
        STOP.
    ENDCASE.

  WHEN '%'.
    PERFORM calc_percentage
      USING p_num1
            p_num2
      CHANGING v_result.

  WHEN '+'.
    v_result = p_num1 + p_num2.

  WHEN '-'.
    v_result = p_num1 - p_num2.

  WHEN '*'.
    v_result = p_num1 * p_num2.

  WHEN '/'.
    IF p_num2 IS NOT INITIAL.
      v_result = p_num1 / p_num2.

    ELSE.
      MESSAGE 'DIVISÃO POR ZERO INVÁLIDA' TYPE 'I'.
      STOP.
    ENDIF.

  WHEN OTHERS.
    MESSAGE 'OPERAÇÃO INVÁLIDA' TYPE 'I'.
    STOP.
ENDCASE.

WRITE: 'O RESULTADO É:', v_result.

FORM calc_percentage  USING    p_ACT TYPE i
                               p_MAX TYPE i
                      CHANGING p_result TYPE tv_result.
  p_result = p_act / p_max * 100.
ENDFORM.
