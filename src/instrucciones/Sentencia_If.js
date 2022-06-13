"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const instrucciones_1 = require("../abstract/instrucciones");
/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class S_If extends instrucciones_1.Instruccion {
    constructor(nombre, tipo, line, column
    //public expresion: Expresion
    ) {
        super(line, column);
        this.nombre = nombre;
        this.tipo = tipo;
    }
    execute() {
        //codigo analisis semantico
    }
}
