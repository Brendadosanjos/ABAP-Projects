*&---------------------------------------------------------------------*
*& Report Z_ABAP_TYPES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_abap_types.

*TIPOS DE VARIÁVEIS
*INT - INTEIROS---------------------------------

DATA: num1   TYPE i,
      num2   TYPE i,
      result TYPE i.

num1 = 5.
num2 = 7.
result = num1 + num2.

WRITE: 'o resultado da soma é:', result.


*CHAR - Texto de 1 posição----------------------
DATA: validar TYPE c.
validar = 'F'.
WRITE: / 'Verdadeiro ou falso? "V" para verdadeiro e "F" para falso:' ,  validar.


*STRING - Texto de 256 caracteres---------------
DATA: mensagem TYPE string.
mensagem = 'Esta é uma string'.
WRITE: / mensagem.

*DATE - data do calendários---------------------
DATA: aniversario TYPE dats,
      data_atual  TYPE dats.

aniversario = '19970419'.
WRITE: / 'A data do aniversário dela é:' , aniversario.

data_atual = sy-datum. "variável de sistema-----
WRITE: / 'A data de hoje é: ', data_atual.

*TIME - horário do relógio(uzeit)---------------
DATA: hora_atual TYPE uzeit,
      hora_sistema TYPE uzeit.
hora_atual = '222100'.
WRITE: / 'A hora que fiz esta linha do programa foi: ', hora_atual.

hora_sistema = sy-uzeit.
WRITE: / 'A hora do sistema é: ', hora_sistema.

*DECIMAL - números com casas decimais-----------
DATA: valor_iphone TYPE P DECIMALS 2.
valor_iphone = '8200.99'.
WRITE: / 'O valor do iphone 16 é:', valor_iphone,', e está um absurdo de caro'.

*CONSTANTS - variáveis que não mudam o valor----
CONSTANTS: type_error TYPE C VALUE 'E'.

*RANGES - intervalos de valores, datas de até---
*SING -> E - EXCLUDE | I -> INCLUDE
*OPTION -> EQ - IGUAL | BT -> BETWEEN | NE -> NÃO IGUAL
*LOW -> VALOR DE
*HIGH -> VALOR ATÉ

intervalo_data-sign = 'I'.
intervalo_data-option = 'BT'.
intervalo_data-low = '19960114'.
intervalo_data-high = '20241012'.

*ESTRUTURAS - variáveis com colunas
*armazenar dados de um cliente
*Nome completo, data nascimento, email.
TYPES: BEGIN OF ty_cliente,
        nome_completo TYPE string,
        data_nascimento TYPE dats,
        email TYPE string,
       END OF ty_cliente.
DATA: cliente TYPE