"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Literal = void 0;
const express_1 = require("../abstract/express");
const type_1 = require("../symbols/type");
class Literal extends express_1.Expression {
    constructor(value, type, line, column) {
        super(line, column);
        this.value = value;
        this.type = type;
    }
    execute() {
        if (this.type == type_1.Type.INT)
            return { value: Number(this.value), type: type_1.Type.INT };
        else if (this.type == type_1.Type.DOUBLE)
            return { value: Number(this.value), type: type_1.Type.DOUBLE };
        else if (this.type == type_1.Type.CHAR) {
            this.value = (this.value).replaceAll("\'", "");
            return { value: this.value, type: type_1.Type.CHAR };
        }
        else if (this.type == type_1.Type.STRING) {
            this.value = (this.value).replaceAll("\"", "");
            return { value: this.value, type: type_1.Type.STRING };
        }
        else if (this.type == type_1.Type.BOOLEAN) {
            if (this.value == "true")
                return { value: Boolean(true), type: type_1.Type.BOOLEAN };
            else
                return { value: Boolean(false), type: type_1.Type.BOOLEAN };
        }
        else if (this.type == type_1.Type.VAR) {
            return { value: this.value, type: type_1.Type.VAR };
        }
        else if (this.type == type_1.Type.LET) {
            return { value: this.value, type: type_1.Type.LET };
        }
        else if (this.type == type_1.Type.CONST) {
            return { value: this.value, type: type_1.Type.CONST };
        }
        else
            return { value: this.value, type: type_1.Type.error };
    }
}
exports.Literal = Literal;
