USE SUCOS_VENDAS;

CREATE TABLE TAB_LOOPING (ID INT);

CALL looping_while(1,1000);

CALL soma_dias_notas;