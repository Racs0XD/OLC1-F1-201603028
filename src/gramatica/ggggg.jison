%{
const { AST } = require('./src/AST/AST');


    //este es un comentario
%}



%lex

%options case-insensitive

entero      ["-"|"+"]?[0-9]+\b
decimal     ["-"|"+"]?[0-9]+("."[0-9]+)
cadena      \"[^\"]*\"
boolean        "true"|"false"
id          ([a-zA-Z])[a-zA-Z0-9_ñÑ]*

%%

\s+											// espacios en blanco
"//".*										// comentario simple
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas


//------------------------------- Tipos ----------------------------
{entero}            {return 'entero';                    }
{decimal}           {return 'decimal';                    }
{cadena}            {return 'cadena';                    }
{boolean}           {return 'boolean';                    }
{id}                {return 'id';                    }
//------------------------------ Signos ----------------------------
";"                 {return 'punto_coma';                    }
","                 {return 'coma';                    }
":"                 {return 'dos_puntos';                    }
"{"                 {return 'llave_izq';                    }
"}"                 {return 'llave_der';                    }
"("                 {return 'par_izq';                    }
")"                 {return 'par_der';                    }
"["                 {return 'cor_izq';                    }
"]"                 {return 'cor_der';                    }
"."                 {return 'punto';                    }
//--------------------- Incremento y decremento ---------------------
"++"                {return 'incremento'                    }
"--"                {return 'decremento'                    }
//-------------------- Expresiones arimtméticas ---------------------
"+"                 {return 'mas';                    }
"-"                 {return 'menos';                    }
"*"                 {return 'por';                    }
"/"                 {return 'div';                    }
"**"                {return 'potencia';                    }
"%"                 {return 'mod';                    }
//-------------------- Expresiones relacionales ---------------------
">"                 {return 'mayor';                    }
"<"                 {return 'menor';                    }
">="                {return 'mayor_igual';                    }
"<="                {return 'menor_igual';                    }
"=="                {return 'igual_que';                    }
"!="                {return 'dif_que';                    }
//----------------------- Expresiones lógicas -----------------------
"||"                {return 'or';                    }
"&&"                {return 'and';                    }
"^"                 {return 'xor';                    }
"!"                 {return 'not';                    }
//------------ Asignación y declaración de variables ----------------
"="                 {return 'igual';                    }
//----------------------- Variables constantes ----------------------
"const"             {return 'const';                    }
//---------------------- Sentencias de control ----------------------
"int"               {return 'int';                    }
"double"            {return 'double';                    }
"char"              {return 'char';                    }
"boolean"            {return 'boolean';                    }
"string"            {return 'string';                    }
"if"                {return 'if';                    }
"else"              {return 'else';                    }
"switch"            {return 'switch';                    }
"case"              {return 'case';                    }
"for"               {return 'for';                    }
"while"             {return 'while';                    }
"do"                {return 'do';                    }
"break"             {return 'break';                    }
"continue"          { return 'continue';                    }
"void"              {return 'void';                    }
"call"              {return 'call';                    }
"return"            {return 'return';                    }
"println"           {return 'println';                    }
"print"             {return 'print';                    }
"typeof"            {return 'typeof';                    }

//  [ \r\t]+            {}
//  \n                  {}

<<EOF>>             return 'EOF'; 

.                   {
                        const er = new error_1.error('Error Lexico: ' + yytext + ' no es valido, en la line: ' + yylloc.first_line + ', en la columna: ' + (yylloc.first_column+1)); 
                        errores_1.Errores.getInstance().push(er);
                    }


/lex


%left 'or'
%left 'and'
%left 'xor'
%left 'mayor' 'menor' 'mayor_igual' 'menor_igual' 'igual_que' 'dif_que'
%left 'mas' 'menos'
%left 'por' 'div' 'mod' 'potencia'
%right 'not'




%start INIT


%%

INIT 
    :   IS  EOF { 
                 return new AST({label: 'INIT', son: [$1], line: yylineno});
                }
    ;

IS
    :   IS I  {$$ = new AST({label: 'Instrucciones', son: [$1.son, $2.son], line: yylineno});}
    |   I     {$$ = new AST({label: 'Instrucciones', son: [$1.son], line: yylineno});}
;

I
    :   Incremento_Decremento { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Dcl_Variable { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Dcl_Const { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Asignacion { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   If { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Switch { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   For { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   While { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Do_While { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Break { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Continue { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Dcl_Metodo { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Dcl_Funcion { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Llamada_Metodo { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Llamada_Funcion { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Return { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Print { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Println { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Typeof { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
;

Incremento_Decremento
  : id incremento punto_coma { $$ = new AST({label: 'Incremento_Decremento', son: [$1,$2,$3], line: yylineno}); }
  | id decremento punto_coma { $$ = new AST({label: 'Incremento_Decremento', son: [$1,$2,$3], line: yylineno}); }
;

Dcl_Variable
  : Tipo_Declaracion_Variable L_Declaraciones punto_coma { $$ = new AST({label: 'DECLARACION_VARIABLE', son: [$1,$2,$3], line: yylineno});  }
;

L_Declaraciones 
  : Declaracion_Id  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
  | Declaracion_Id_Tipo  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
  | Declaracion_Id_Tipo_Corchetes  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
  | Declaracion_Id_Expresion  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
  | Declaracion_Id_Tipo_Expresion  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
  | Declaracion_Id_Tipo_Corchetes_Expresion  { $$ = new AST({label: 'Lista_Declaraciones', son: [$1], line: yylineno}); }
;

//let id : Tipo_Variable Lista_Corchetes = EXP ;
Declaracion_Id_Tipo_Corchetes_Expresion
  : id dos_puntos Tipo_Variable Lista_Corchetes igual EXP { $$ = new AST({label: 'Declaracion_Id_Tipo_Corchetes_Expresion', son: [$1,$2,$3,$4,$5,$6], line: yylineno}); }
;

//let id : Tipo_Variable = EXP;
Declaracion_Id_Tipo_Expresion
  : id dos_puntos Tipo_Variable igual EXP { $$ = new AST({label: 'Declaracion_Id_Tipo_Expresion', son: [$1,$2,$3,$4,$5], line: yylineno}); }
;

//let id = EXP ;
Declaracion_Id_Expresion
  : id igual EXP { $$ = new AST({label: 'Declaracion_Id_Expresion', son: [$1,$2,$3], line: yylineno}); }
;

//let id : Tipo_Variable ;
Declaracion_Id_Tipo 
  : id dos_puntos Tipo_Variable { $$ = new AST({label: 'Declaracion_Id_Tipo', son: [$1,$2,$3], line: yylineno}); }
;

//let id ;
Declaracion_Id 
  : id  { $$ = new AST({label: 'Declaracion_Id', son: [$1], line: yylineno}); }
;

//let id : TIPO_VARIABLE_NATIVA Lista_CORCHETES ;
DEC_ID_TIPO_CORCHETES
  : id dos_puntos TIPO_VARIABLE_NATIVA Lista_CORCHETES { $$ = new AST({label: 'DEC_ID_TIPO_CORCHETES', son: [$1,$2,$3,$4], line: yylineno}); }
;

Lista_CORCHETES
  : Lista_CORCHETES cor_izq cor_der { $$ = new AST({label: 'Lista_CORCHETES', son: [...$1.son, '[]'], line: yylineno}); }
  | cor_izq cor_der { $$ = new AST({label: 'Lista_CORCHETES', son: ['[]'], line: yylineno}); }
;

Tipo_Declaracion_Variable
  : let       { $$ = new AST({label: 'TIPO_DEC_VARIABLE', son: [$1], line: yylineno}); }
  | const     { $$ = new AST({label: 'TIPO_DEC_VARIABLE', son: [$1], line: yylineno}); }
;

Tipo_Variable
  : cadena  { $$ = new AST({label: 'Tipo_Variable', son: [$1], line: yylineno}); }
  | entero  { $$ = new AST({label: 'Tipo_Variable', son: [$1], line: yylineno}); }
  | decimal  { $$ = new AST({label: 'Tipo_Variable', son: [$1], line: yylineno}); }
  | boolean { $$ = new AST({label: 'Tipo_Variable', son: [$1], line: yylineno}); }
  | void    { $$ = new AST({label: 'Tipo_Variable', son: [$1], line: yylineno}); }
  | id      { $$ = new AST({label: 'Tipo_Variable', son: [new AST({label: 'ID', son: [$1], line: yylineno})], line: yylineno}); }
;