"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Arithmetic = void 0;
const express_1 = require("../../abstract/express");
const type_1 = require("../../symbols/type");
const aritmeticOptions_1 = require("./aritmeticOptions");
class Arithmetic extends express_1.Expression {
    constructor(left, rigth, type, line, column) {
        super(line, column);
        this.left = left;
        this.rigth = rigth;
        this.type = type;
    }
    execute() {
        let result = {
            value: null,
            type: type_1.Type.error
        };
        const nodoIzq = this.left.execute();
        const nodoDer = this.rigth.execute();
        if (this.type == aritmeticOptions_1.ArithmeticOptions.MAS) {
            //Condicional Int + Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value + nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Int + double o Double + Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value + nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int + Char o Char + Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value + (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
                //Condicional Char + Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) + nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Int + String o String + Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.STRING ||
                nodoIzq.type == type_1.Type.STRING && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (String(nodoIzq.value) + String(nodoDer.value)),
                    type: type_1.Type.STRING
                };
                //Condicional Douebl + Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value + nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble + Char
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value + (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char + Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) + nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Double + String o String + Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.STRING ||
                nodoIzq.type == type_1.Type.STRING && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (String(nodoIzq.value) + String(nodoDer.value)),
                    type: type_1.Type.STRING
                };
                //Condicional Char + Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) + (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
                //Condicional Char + String o String + Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.STRING ||
                nodoIzq.type == type_1.Type.STRING && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (String(nodoIzq.value) + String(nodoDer.value)),
                    type: type_1.Type.STRING
                };
                //Condicional String + String
            }
            else if (nodoIzq.type == type_1.Type.STRING || nodoDer.type == type_1.Type.STRING) {
                result = {
                    value: (String(nodoIzq.value) + String(nodoDer.value)),
                    type: type_1.Type.STRING
                };
            }
            else {
                result = {
                    value: (String(nodoIzq.value) + String(nodoDer.value)),
                    type: type_1.Type.STRING
                };
            }
        }
        else if (this.type == aritmeticOptions_1.ArithmeticOptions.MENOS) {
            //Condicional Int - Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value - nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Int - double o Double - Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value - nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int - Char 
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value - (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
                //Condicional Char - Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) - nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Douebl - Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value - nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble - Char 
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value - (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char - Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) - nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char - Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) - (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
            }
        }
        else if (this.type == aritmeticOptions_1.ArithmeticOptions.MULT) {
            //Condicional Int * Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value * nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Int * double o Double * Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value * nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int * Char
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Char * Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Doueble * Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value * nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble * Char
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value * (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char * Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char * Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) * (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
            }
        }
        else if (this.type == aritmeticOptions_1.ArithmeticOptions.DIV) {
            //Condicional Int / Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value / nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Int / double o Double / Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value / nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int / Char
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value / (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
                //Condicional Char / Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) / nodoDer.value),
                    type: type_1.Type.INT
                };
                //Condicional Doueble / Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value / nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble / Char
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value / (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char / Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) / nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char / Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) / (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.INT
                };
            }
        }
        else if (this.type == aritmeticOptions_1.ArithmeticOptions.POT) {
            //Condicional Int ** Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value ** nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int ** double o Double ** Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value ** nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int ** Char
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value ** (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char ** Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) ** nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble ** Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value ** nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble ** Char
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value ** (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char ** Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) ** nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char ** Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) ** (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
            }
        }
        else if (this.type == aritmeticOptions_1.ArithmeticOptions.MOD) {
            //Condicional Int % Int
            if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value % nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int % double o Double % Int
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.DOUBLE ||
                nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: (nodoIzq.value % nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Int % Char
            }
            else if (nodoIzq.type == type_1.Type.INT && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value % (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char % Int
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.INT) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) % nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble % Double
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: (nodoIzq.value % nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Doueble % Char
            }
            else if (nodoIzq.type == type_1.Type.DOUBLE && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: (nodoIzq.value % (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char % Double
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.DOUBLE) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) % nodoDer.value),
                    type: type_1.Type.DOUBLE
                };
                //Condicional Char % Char
            }
            else if (nodoIzq.type == type_1.Type.CHAR && nodoDer.type == type_1.Type.CHAR) {
                result = {
                    value: ((nodoIzq.value).charCodeAt(0) % (nodoDer.value).charCodeAt(0)),
                    type: type_1.Type.DOUBLE
                };
            }
        }
        return result;
    }
}
exports.Arithmetic = Arithmetic;
