%{
const { AST } = require('../AST/AST');

const { D_Id } = require("../instrucciones/declaraciones/D_Id");
const { D_Id_Exp } = require("../instrucciones/declaraciones/D_Id_Exp");
const { D_Id_Tipo } = require("../instrucciones/declaraciones/D_Id_Tipo");
const { D_Id_Tipo_Exp } = require("../instrucciones/declaraciones/D_Id_Tipo_Exp");

const { Literal } = require('../expresiones/literal')
const { Type } = require('../symbols/type')
const { Arithmetic } = require('../expresiones/Aritmeticas/aritmeticas')
const { ArithmeticOptions } = require('../expresiones/Aritmeticas/aritmeticOptions')
%}



%lex

%options case-insensitive

int         ["-"|"+"]?[0-9]+\b
double      ["-"|"+"]?[0-9]+("."[0-9]+)
char        \'[^\']?\'
string      \"[^\"]*\"
boolean     "true"|"false"
id          ([a-zA-Z])[a-zA-Z0-9_ñÑ]*

%%

\s+											// espacios en blanco
"//".*										// comentario simple
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas
//-------------------------------------------------------------------
//----------------------- Variables constantes ----------------------
//-------------------------------------------------------------------

"const"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'const';
                    }
"var"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'var';
                    }
"let"             {
                        console.log("reconoci palabra reservada: "+yytext);
                        return 'let';
                    }    

//------------------------------------------------------------------
//------------------------------- Tipos ----------------------------
//------------------------------------------------------------------

{int}               {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 't_int';
                    }
{double}            {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 't_double';
                    }
{char}            {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 't_char';
                    }
{string}            {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 't_string';
                    }
{boolean}           {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 't_boolean';
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
{id}                {
                        console.log("el lexema encontrado es :"+ yytext);       
                        return 'id';
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
                        console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + (yylloc.first_column+1));
                    }


/lex


%left 'or'
%left 'and'
%left 'xor'
%left 'mayor' 'menor' 'mayor_igual' 'menor_igual' 'igual_que' 'dif_que'
%left 'mas' 'menos'
%left 'por' 'div' 'mod' 'potencia'
%left 'umenos'
%right 'not'




%start INIT


%%

INIT 
    :   Instrucciones  EOF  { 
                                return $1
                                console.log("termine de analizar,el resultado es ",$1); 
                            }
    ;

Instrucciones
    :   Instrucciones Instruccion   { $1.push($2); $$ = $1;}
    |   Instruccion                 {$$ = [$1];}
;

Instruccion
    :   L_Declaraciones         { $$ = $1; }
    |   Expresion_Aritmetica    { $$ = $1;}
    /*|    Incremento_Decremento  { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Dcl_Const               { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Asignacion              { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   If                      { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Switch                  { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   For                     { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   While                   { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Do_While                { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Break                   { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Continue                { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Dcl_Metodo              { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Dcl_Funcion             { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }    
    |   Llamada_Metodo          { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Llamada_Funcion         { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Return                  { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Print                   { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Println                 { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
    |   Typeof                  { $$ = new AST({label: 'Instruccion', son: [$1], line: yylineno}); }
*/;

/*
Incremento_Decremento
    : id incremento punto_coma { $$ = new AST({label: 'Incremento_Decremento', son: [$1,$2,$3], line: yylineno}); }
    | id decremento punto_coma { $$ = new AST({label: 'Incremento_Decremento', son: [$1,$2,$3], line: yylineno}); }
;
*/

L_Declaraciones
//let id : Tipo_Dato_Declaracion = Expresion; 
    : Tipo_Declaracion_Variable id dos_puntos Tipo_Dato_Declaracion igual Declaracion_Exp punto_coma  { $$ = new D_Id_Tipo_Exp($1,$2,$4,$6,@1.first_line,@1.first_column);  }
//let id = Expresion ;
    | Tipo_Declaracion_Variable id igual Declaracion_Exp punto_coma                                   { $$ = new D_Id_Exp($1,$2,$4,@1.first_line,@1.first_column);  } 
//let id ;
    | Tipo_Declaracion_Variable id punto_coma                                                   { $$ = new D_Id($1,$2,@1.first_line,@1.first_column);  }
//let id : Tipo_Dato_Declaracion ;
    | Tipo_Declaracion_Variable id dos_puntos Tipo_Dato_Declaracion punto_coma                  { $$ = new D_Id_Tipo($1,$2,$4,@1.first_line,@1.first_column);  }
;

Tipo_Declaracion_Variable
    : let     { $$ = $1; }  
    | const   { $$ = $1; }
    | var     { $$ = $1; }
;

Tipo_Dato_Declaracion
    : int       { $$ = $1;}
    | double    { $$ = $1;}
    | char      { $$ = $1;}
    | string    { $$ = $1;}
    | boolean   { $$ = $1;}
;

Declaracion_Exp
    : t_int       { $$ = $1;}
    | t_double    { $$ = $1;}
    | t_char      { $$ = $1;}
    | t_string    { $$ = $1;}
    | t_boolean   { $$ = $1;}
;

Expresion_Aritmetica
    //Expresiones aritméticas
    : Expresion_Aritmetica mas Expresion_Aritmetica             { $$ = new Arithmetic($1,$3,ArithmeticOptions.MAS,@1.first_line,@1.first_column); }
    | Expresion_Aritmetica menos Expresion_Aritmetica           { $$ = new Arithmetic($1,$3,ArithmeticOptions.MENOS,@1.first_line,@1.first_column); }
    | Expresion_Aritmetica por Expresion_Aritmetica             { $$ = new Arithmetic($1,$3,ArithmeticOptions.MULT,@1.first_line,@1.first_column); }
    | Expresion_Aritmetica div Expresion_Aritmetica             { $$ = new Arithmetic($1,$3,ArithmeticOptions.DIV,@1.first_line,@1.first_column); }
    | Expresion_Aritmetica potencia Expresion_Aritmetica        { $$ = new Arithmetic($1,$3,ArithmeticOptions.POT,@1.first_line,@1.first_column); }
    | Expresion_Aritmetica mod Expresion_Aritmetica             { $$ = new Arithmetic($1,$3,ArithmeticOptions.MOD,@1.first_line,@1.first_column); }
    | Entrada_Exp_Aritmetica                                    { $$ = $1}
;

Entrada_Exp_Aritmetica
    : Exp_Int       { $$ = new Literal($1, Type.INT,@1.first_line,@1.first_column);}
    | Exp_Double    { $$ = new Literal($1, Type.DOUBLE,@1.first_line,@1.first_column);}
    | Exp_Char      { $$ = new Literal($1, Type.CHAR,@1.first_line,@1.first_column);}
    | Exp_String    { $$ = new Literal($1, Type.STRING,@1.first_line,@1.first_column);}
    | Exp_Boolean   { $$ = new Literal($1, Type.BOOLEAN,@1.first_line,@1.first_column);}
;

/*
Expresion_Compoarativa
    //Expresiones relacionales
    : id incremento                     { $$ = new AST({label: 'Expresion_Aritmetica', son: [$1, $2], line: yylineno}); }
    | id decremento                     { $$ = new AST({label: 'Expresion_Aritmetica', son: [$1, $2], line: yylineno}); }
    | par_izq Expresion_Aritmetica par_der         { $$ = new AST({label: 'Expresion_Aritmetica', son: [$1, $2, $3], line: yylineno}); }
    | Entrada_Exp_Aritmetica    {$$ = $1;}
    | Expresion mayor Expresion         { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion menor Expresion         { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion mayor_igual Expresion   { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion menor_igual Expresion   { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion igual_que Expresion     { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion dif_que Expresion       { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    //Expresiones Lógicas
    | Expresion or Expresion            { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion and Expresion           { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | Expresion xor Expresion           { $$ = new AST({label: 'Expresion', son: [$1, $2, $3], line: yylineno}); }
    | not Expresion                     { $$ = new AST({label: 'Expresion', son: [$1, $2], line: yylineno}); }
    //Tipo Valores 
    | int                            { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Entero', son: [$1], line: yylineno})], line: yylineno}); }
    | double                           { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Decimal', son: [$1], line: yylineno})], line: yylineno}); }
    | string                            { $$ = new AST({label: 'Expresion', son: [new AST({label: 'String', son: [$1], line: yylineno})], line: yylineno}); }
    | id                                { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Id', son: [$1], line: yylineno})], line: yylineno}); }
    | true                              { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Boolean', son: [$1], line: yylineno})], line: yylineno}); }
    | false                             { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Boolean', son: [$1], line: yylineno})], line: yylineno}); }
    | null                              { $$ = new AST({label: 'Expresion', son: [new AST({label: 'Null', son: [$1], line: yylineno})], line: yylineno}); }
    //Funciones y Metodos

    | Llamada_Funcion_Expresion         { $$ = new AST({label: 'Expresion', son: [$1], line: yylineno}); }    
    | Llamada_Metodo_Expresion         { $$ = new AST({label: 'Expresion', son: [$1], line: yylineno}); }
;
*/

/*
Tipo_Dato
    : string    { $$ = new AST({label: 'Tipo_Dato', son: [$1], line: yylineno}); }
    | int       { $$ = new AST({label: 'Tipo_Dato', son: [$1], line: yylineno}); }
    | double    { $$ = new AST({label: 'Tipo_Dato', son: [$1], line: yylineno}); }
    | boolean   { $$ = new AST({label: 'Tipo_Dato', son: [$1], line: yylineno}); }
    | void      { $$ = new AST({label: 'Tipo_Dato', son: [$1], line: yylineno}); }
    | id        { $$ = new AST({label: 'Tipo_Dato', son: [new AST({label: 'ID', son: [$1], line: yylineno})], line: yylineno}); }
;*/

/*
//------------------------------------------------------------------------------------------------------------ 
//---------------------------------------------   Sentencia If   ---------------------------------------------
//------------------------------------------------------------------------------------------------------------ 

S_If
  : If                                                              { $$ = new AST({label: 'INSTRUCCION_IF', son: [$1], line: yylineno}); }
  | If Else                                                         { $$ = new AST({label: 'INSTRUCCION_IF', son: [$1,$2], line: yylineno}); }
  | If L_Else_If                                                    { $$ = new AST({label: 'INSTRUCCION_IF', son: [$1,$2], line: yylineno}); }
  | If L_Eelse_If Else                                              { $$ = new AST({label: 'INSTRUCCION_IF', son: [$1,$2,$3], line: yylineno}); }
;

If
  : if par_izq Expresion par_der llave_izq IS llave_der        { $$ = new AST({label: 'If', son: [$1,$2,$3,$4,$5,$6,$7], line: yylineno}); }
;

Else
  : else llave_izq IS llave_der                          { $$ = new AST({label: 'Else', son: [$1,$2,$3,$4], line: yylineno}); }
;

Else_If
  : else if par_izq Expresion par_der llave_izq IS llave_der   { $$ = new AST({label: 'Else_If', son: [$1,$2,$3,$4,$5,$6,$7,$8], line: yylineno}); }
;

L_Else_If
  : L_Else_If Else_If                                               { $$ = new AST({label: 'L_Else_If', son: [...$1.son, $2], line: yylineno}); }
  | Else_If                                                         { $$ = new AST({label: 'L_Else_If', son: [$1], line: yylineno}); }
;
*/