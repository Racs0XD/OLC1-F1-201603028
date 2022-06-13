"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.D_Id_Tipo_Exp = void 0;
const instrucciones_1 = require("../../abstract/instrucciones");
/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class D_Id_Tipo_Exp extends instrucciones_1.Instruccion {
    constructor(tipo_declaracion, identificador, tipo, expresion, line, column
    //public expresion: Expresion
    ) {
        super(line, column);
        this.tipo_declaracion = tipo_declaracion;
        this.identificador = identificador;
        this.tipo = tipo;
        this.expresion = expresion;
    }
    execute(Env) {
        //codigo analisis semantico
        console.log("Declarando nueva variable: " + this.identificador);
        console.log(this);
        const x = this.expresion.execute(Env);
    }
}
exports.D_Id_Tipo_Exp = D_Id_Tipo_Exp;
