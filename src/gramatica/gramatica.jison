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


//------------------------------------------------------------------
//------------------------------- Tipos ----------------------------
//------------------------------------------------------------------

{entero}            {
                        lista.push("el lexema encontrado es :"+ yytext);       
                        return 'entero';
                    }
{decimal}           {
                        lista.push("el lexema encontrado es :"+ yytext);       
                        return 'decimal';
                    }
{cadena}            {
                        lista.push("el lexema encontrado es :"+ yytext);       
                        return 'cadena';
                    }
{boolean}           {
                        lista.push("el lexema encontrado es :"+ yytext);       
                        return 'boolean';
                    }
{id}                {
                        lista.push("el lexema encontrado es :"+ yytext);       
                        return 'id';
                    }

//------------------------------------------------------------------
//------------------------------ Signos ----------------------------
//------------------------------------------------------------------

";"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'punto_coma';
                    }
","                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'coma';
                    }
":"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'dos_puntos';
                    }
"{"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'llave_izq';
                    }
"}"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'llave_der';
                    }
"("                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'par_izq';
                    }
")"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'par_der';
                    }
"["                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'cor_izq';
                    }
"]"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'cor_der';
                    }
"."                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'punto';
                    }


//-------------------------------------------------------------------
//--------------------- Incremento y decremento ---------------------
//-------------------------------------------------------------------

"++"                {
                        console.log("reconoci incremento: "+yytext);
                        return 'incremento'
                    }
"--"                {
                        console.log("reconoci decremento logica: "+yytext);
                        return 'decremento'
                    }

//-------------------------------------------------------------------
//-------------------- Expresiones arimtméticas ---------------------
//-------------------------------------------------------------------
"+"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'mas';
                    }
"-"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'menos';
                    }
"*"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'por';
                    }
"/"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'div';
                    }
"**"                {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'potencia';
                    }
"%"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'mod';
                    }

//-------------------------------------------------------------------
//-------------------- Expresiones relacionales ---------------------
//-------------------------------------------------------------------

">"                 {
                        console.log("reconoci expresión relacional: "+yytext);   
                        return 'mayor';
                    }
"<"                 {
                        console.log("reconoci expresión relacional: "+yytext);   
                        return 'menor';
                    }
">="                {
                        console.log("reconoci expresión relacional: "+yytext);
                        return 'mayor_igual';
                    }
"<="                {
                        console.log("reconoci expresión relacional: "+yytext);   
                        return 'menor_igual';
                    }
"=="                {
                        console.log("reconoci expresión relacional: "+yytext);   
                        return 'igual_que';
                    }
"!="                {
                        console.log("reconoci expresión relacional: "+yytext);   
                        return 'dif_que';
                    }

//-------------------------------------------------------------------
//----------------------- Expresiones lógicas -----------------------
//-------------------------------------------------------------------

"||"                {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'or';
                    }
"&&"                {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'and';
                    }
"^"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'xor';
                    }
"!"                 {
                        console.log("reconoci expresión logica: "+yytext);
                        return 'not';
                    }

//-------------------------------------------------------------------
//------------ Asignación y declaración de variables ----------------
//-------------------------------------------------------------------

"="                 {
                        console.log("reconoci asignacion: "+yytext);
                        return 'igual';
                    }

//-------------------------------------------------------------------
//----------------------- Variables constantes ----------------------
//-------------------------------------------------------------------

"const"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'const';
                    }

//-------------------------------------------------------------------
//---------------------- Sentencias de control ----------------------
//-------------------------------------------------------------------

"int"               {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'int';
                    }
"double"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'double';
                    }
"char"              {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'char';
                    }
"boolean"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'boolean';
                    }
"string"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'string';
                    }

"if"                {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'if';
                    }
"else"              {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'else';
                    }
"switch"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'switch';
                    }
"case"              {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'case';
                    }
"for"               {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'for';
                    }
"while"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'while';
                    }
"do"                {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'do';
                    }
"break"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'break';
                    }
"continue"          {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'continue';
                    }
"void"              {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'void';
                    }
"call"              {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'call';
                    }
"return"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'return';
                    }
"println"           {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'println';
                    }
"print"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'print';
                    }
"typeof"            {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'typeof';
                    }

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

//let id : Tipo_Variable Lista_Corchetes = Expresion ;
Declaracion_Id_Tipo_Corchetes_Expresion
  : id dos_puntos Tipo_Variable Lista_Corchetes igual Expresion { $$ = new AST({label: 'Declaracion_Id_Tipo_Corchetes_Expresion', son: [$1,$2,$3,$4,$5,$6], line: yylineno}); }
;

//let id : Tipo_Variable = Expresion;
Declaracion_Id_Tipo_Expresion
  : id dos_puntos Tipo_Variable igual Expresion { $$ = new AST({label: 'Declaracion_Id_Tipo_Expresion', son: [$1,$2,$3,$4,$5], line: yylineno}); }
;

//let id = Expresion ;
Declaracion_Id_Expresion
  : id igual Expresion { $$ = new AST({label: 'Declaracion_Id_Expresion', son: [$1,$2,$3], line: yylineno}); }
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