"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Error = void 0;
class Error {
    constructor({ tipo, linea, desc }) {
        const valor = linea;
        Object.assign(this, { tipo, linea: valor.toString(), desc });
    }
}
exports.Error = Error;
