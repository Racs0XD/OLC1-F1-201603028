"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Environment = void 0;
const symbols_1 = require("./symbols");
const type_1 = require("./type");
class Environment {
    constructor(anterior) {
        this.anterior = anterior;
        this.tablaSimbolos = new Map();
    }
    getEnv() {
        return this.tablaSimbolos;
    }
    guardar_variable(identificador, valor, type) {
        if (!this.buscar_variable(identificador)) {
            this.tablaSimbolos.set(identificador, new symbols_1.Symb(valor, identificador, type));
            return true;
        }
        console.log("esta variable [" + identificador + "] ya existe...");
        return false;
    }
    buscar_variable(nombre) {
        for (let entry of Array.from(this.tablaSimbolos.entries())) {
            if (entry[0] == nombre)
                return true;
        }
        return false;
    }
    getTipo_variable(nombre) {
        for (let entry of Array.from(this.tablaSimbolos.entries())) {
            if (entry[0] == nombre)
                return entry[1].type;
        }
        return type_1.Type.error;
    }
    actualizar_variable(nombre, new_valor) {
        for (let entry of Array.from(this.tablaSimbolos.entries())) {
            if (entry[0] == nombre) {
                entry[1].value = new_valor;
            }
        }
    }
}
exports.Environment = Environment;
