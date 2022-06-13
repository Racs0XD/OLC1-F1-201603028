"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Instruccion = void 0;
/*  export permite que otros accedan a esta clase
    abstract convierte en clase abstracta
*/
class Instruccion {
    constructor(line, column) {
        this.line = line;
        this.column = column;
        this.line = line;
        this.column = column + 1;
    }
}
exports.Instruccion = Instruccion;
