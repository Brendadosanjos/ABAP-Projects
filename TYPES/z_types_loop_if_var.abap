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
DATA: hora_atual   TYPE uzeit,
      hora_sistema TYPE uzeit.
hora_atual = '222100'.
WRITE: / 'A hora que fiz esta linha do programa foi: ', hora_atual.

hora_sistema = sy-uzeit.
WRITE: / 'A hora do sistema é: ', hora_sistema.

*DECIMAL - números com casas decimais-----------
DATA: valor_iphone TYPE p DECIMALS 2.
valor_iphone = '8200.99'.
WRITE: / 'O valor do iphone 16 é:', valor_iphone,', e está um absurdo de caro'.

*CONSTANTS - variáveis que não mudam o valor----
CONSTANTS: type_error TYPE c VALUE 'E'.

*RANGES - intervalos de valores, datas de até---
*SING -> E - EXCLUDE | I -> INCLUDE
*OPTION -> EQ - IGUAL | BT -> BETWEEN | NE -> NÃO IGUAL
*LOW -> VALOR DE
*HIGH -> VALOR ATÉ

*intervalo_data-sign = 'I'.
*intervalo_data-option = 'BT'.
*intervalo_data-low = '19960114'.
*intervalo_data-high = '20241012'.

*ESTRUTURAS - variáveis com colunas (armazena só um cliente)
*armazenar dados de um cliente
*Nome completo, data nascimento, email.
TYPES: BEGIN OF ty_cliente,
         nome_completo   TYPE string,
         data_nascimento TYPE dats,
         email           TYPE string,
       END OF ty_cliente.

DATA: cliente TYPE ty_cliente.
cliente-nome_completo = 'Gabriel Dias Farias'.
cliente-email = 'gabriel@gmail.com'.
cliente-data_nascimento = '20210501'.

WRITE: /'O cliente', cliente-nome_completo, 'nasceu em', cliente-data_nascimento, 'tem o email', cliente-email.

*TABLES - tabelas que possuem linhas com estruturas definidas
*para amazenar vários clientes variavel que tem várias linhas e cada linha tem sua coluna
DATA: clientes TYPE TABLE OF ty_cliente.
*adiciona linha em uma tabela*
APPEND cliente TO clientes.
APPEND VALUE ty_cliente(
  nome_completo = 'Ana Vasconcelos'
  data_nascimento = '20000831'
  email = 'ana@gmail.com'
) TO clientes.

*CONDIÇÕES (IF/ELSE)
DATA: numero_if TYPE i.
numero_if = 2.

IF numero_if > 10.
  WRITE: /'O número é maior que 10'.
ELSE.
  WRITE: /'O número é menor que 10'.
ENDIF.
*XSDBOOL
DATA(validacao_if) = xsdbool( numero_if = 2 ). "retorna X se for verdadeiro e vazio se for falso
WRITE: / validacao_if.

DATA(validacao_if2) = xsdbool( numero_if > 1 AND numero_if / 2 = 1 ).
WRITE: / validacao_if2.

DATA(validacao_if3) = xsdbool( numero_if = 0 OR numero_if = 3 ).
WRITE: / validacao_if3.

*CHECK um item que interrompe a execução do programa
CHECK numero_if = 2. "se a condição não for verdadeira ele para o programa

*CASE - condições
DATA numero_case TYPE I VALUE 7.

CASE numero_case.
  WHEN 2.
    WRITE:/'o', numero_case, 'é 2'.
  WHEN 3.
    WRITE:/'o', numero_case, 'é 3'.
  WHEN OTHERS.
    WRITE:/'o',numero_case,'não está na lista de dados'.
ENDCASE.

*LOOP - percorre linhas de uma tabela
TYPES: ty_interger TYPE TABLE OF i WITH DEFAULT KEY.
DATA(tabela) = VALUE ty_interger( ( 1 ) ( 2 ) ( 3 ) ).
* o INTO DATA voce declara qual a linha da tabela que voce quer
LOOP AT tabela INTO DATA(linha).
    WRITE: / 'Linha - ',linha.
ENDLOOP.

*DO - percorre algo N vezes
DO 5 TIMES.
  WRITE: / 'DO - ', 1.
ENDDO.

* READ TABLE - ler uma linha de uma tabela
* o INTO DATA voce declara o nome da linha da tabela que voce quer, o INDEX é qual o elemento
READ TABLE tabela INTO DATA(read_line) INDEX 1.
* se voce quiser algo avançado voce diria o nome da coluna com o WITH KEY
*READ TABLE tabela INTO DATA(read_line) WITH KEY nome_completo = 'Gabriel'. *buscaria na tabela o nome completo
WRITE: / 'READ TABLE-', read_line.
READ TABLE clientes INTO DATA(gabriel) WITH KEY nome_completo = 'Gabriel Dias Farias'.
WRITE: / 'READ TABLE-', gabriel-nome_completo, gabriel-data_nascimento.

*MOVE CORRESPONDING - copia os dados de uma estrutura para outra
*clear - limpa os valores das variaveis
CLEAR: cliente.
cliente-nome_completo = 'Gabriel Dias Farias'.
*MOVE-CORRESPONDING cliente to cliente2.

*VARIÁVEIS SY - variáveis do servidor
WRITE:
  / 'Data servidor:', sy-datum,
  / 'Hora do servidor:', sy-uzeit,
  / 'Nome do servidor:', sy-sysid,
  / 'Usuário Logado:', sy-uname,
  / 'Nome programa:', sy-cprog,
  / 'Título do programa:', sy-title.