"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.D_Id_Tipo = void 0;
const instrucciones_1 = require("../../abstract/instrucciones");
/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class D_Id_Tipo extends instrucciones_1.Instruccion {
    constructor(tipo_declaracion, identificador, tipo, line, column
    //public expresion: Expresion
    ) {
        super(line, column);
        this.tipo_declaracion = tipo_declaracion;
        this.identificador = identificador;
        this.tipo = tipo;
    }
    execute() {
        //codigo analisis semantico
    }
}
exports.D_Id_Tipo = D_Id_Tipo;
