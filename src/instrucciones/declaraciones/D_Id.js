"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.D_Id = void 0;
const instrucciones_1 = require("../../abstract/instrucciones");
/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class D_Id extends instrucciones_1.Instruccion {
    constructor(tipo_declaracion, identificador, line, column
    //public expresion: Expresion
    ) {
        super(line, column);
        this.tipo_declaracion = tipo_declaracion;
        this.identificador = identificador;
    }
    execute(Env) {
        //codigo analisis semantico
    }
}
exports.D_Id = D_Id;
