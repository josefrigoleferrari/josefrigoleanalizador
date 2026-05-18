grammar Analizador;

// ---------------- PARSER RULES ----------------

programa
    : declaraciones EOF
    ;

declaraciones
    : declaracion+
    ;

declaracion
    : tipo IDENTIFICADOR '(' parametros ')' '{' cuerpo '}'
    ;

tipo
    : 'int'
    | 'float'
    | 'char'
    ;

parametros
    : (parametro (',' parametro)*)?
    ;

parametro
    : tipo IDENTIFICADOR
    ;

cuerpo
    : instruccion+
    ;

instruccion
    : retorno
    ;

retorno
    : 'return' expresion ';'
    ;

expresion
    : expresion '+' termino
    | expresion '-' termino
    | termino
    ;

termino
    : termino '*' factor
    | termino '/' factor
    | factor
    ;

factor
    : '(' expresion ')'
    | NUMERO
    | IDENTIFICADOR
    ;

// ---------------- LEXER RULES ----------------

IDENTIFICADOR
    : LETRA (LETRA | DIGITO)*
    ;

fragment LETRA
    : [a-zA-Z]
    ;

fragment DIGITO
    : [0-9]
    ;

NUMERO
    : DIGITO+
    ;

WS
    : [ \t\r\n]+ -> skip
    ;