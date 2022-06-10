%{
const { AST } = require('./src/AST/AST');


    //este es un comentario
%}



%lex

%options case-insensitive

entero      ["-"|"+"]?[0-9]+\b
decimal     ["-"|"+"]?[0-9]+("."[0-9]+)
cadena      \"[^\"]*\"
bool        "true"|"false"
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
{id}            {
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
                        const er = new error_1.error('Error Lexico: ' + yytext + ' no es valido, en la linea: ' + yylloc.first_line + ', en la columna: ' + (yylloc.first_column+1)); 
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
    : IS I  {$$ = new AST({label: 'Instrucciones', son: [$1.son, $2.son], line: yylineno});}
    | I     {$$ = new AST({label: 'Instrucciones', son: [$1.son], line: yylineno});}
;