"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.D_Id_Exp = void 0;
const instrucciones_1 = require("../../abstract/instrucciones");
/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class D_Id_Exp extends instrucciones_1.Instruccion {
    constructor(tipo_declaracion, identificador, expresion, line, column
    //public expresion: Expresion
    ) {
        super(line, column);
        this.tipo_declaracion = tipo_declaracion;
        this.identificador = identificador;
        this.expresion = expresion;
    }
    execute() {
        //codigo analisis semantico
    }
}
exports.D_Id_Exp = D_Id_Exp;
