REPORT ZBC400_00_KA_COMPUTE.

DATA: V_RESULT TYPE P LENGTH 16 DECIMALS 2.

PARAMETERS: P_NUM1 TYPE I,
            P_NUM2 TYPE I,
            P_OPER TYPE C LENGTH 1.

CASE P_OPER.
  WHEN '+'.
    v_result = P_NUM1 + P_NUM2.

  WHEN '-'.
    V_RESULT = P_NUM1 - P_NUM2.

  WHEN '*'.
    V_RESULT = P_NUM1 * P_NUM2.

  WHEN '/'.
    IF P_NUM2 IS NOT INITIAL.
      V_RESULT = P_NUM1 / P_NUM2.

    ELSE.
      MESSAGE 'DIVISÃO POR ZERO INVÁLIDA' TYPE 'I'.
      STOP.
    ENDIF.

  WHEN OTHERS.
    MESSAGE 'OPERAÇÃO INVÁLIDA' TYPE 'I'.
    STOP.
ENDCASE.

WRITE: 'O RESULTADO É:', V_RESULT.


CASE P_NUM1.
    WHEN P_NUM1 < 10 
    MESSAGE TYPE I "DIGITE UM NUMERO MAIOR"
    STOP
ENDCASE.