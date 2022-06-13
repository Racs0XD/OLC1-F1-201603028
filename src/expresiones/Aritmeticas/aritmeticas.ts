import { Expression } from "../../abstract/express";
import { Retorno } from "../../abstract/Retorno";
import { Type } from "../../symbols/type";
import { ArithmeticOptions } from "./aritmeticOptions";

export class Arithmetic extends Expression{

    constructor(
        private left: Expression,
        private rigth: Expression,
        private type: ArithmeticOptions,
        line: number,
        column: number
    ){
        super (line, column)
    }

    public execute(): Retorno {
        let result: Retorno = {
            value:null,
            type:Type.error
        }

        const nodoIzq = this.left.execute()
        const nodoDer = this.rigth.execute()

        if (this.type == ArithmeticOptions.MAS) {

            //Condicional Int + Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value + nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Int + double o Double + Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value + nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int + Char o Char + Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value + (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            //Condicional Char + Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) + nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Int + String o String + Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.STRING ||
                      nodoIzq.type == Type.STRING && nodoDer.type == Type.INT) {
                result = { 
                    value: (String(nodoIzq.value) + String(nodoDer.value)), 
                    type: Type.STRING 
                }
            //Condicional Douebl + Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value + nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble + Char
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value + (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char + Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) + nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Double + String o String + Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.STRING ||
                      nodoIzq.type == Type.STRING && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (String(nodoIzq.value) + String(nodoDer.value)), 
                    type: Type.STRING 
                }
            //Condicional Char + Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) + (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            //Condicional Char + String o String + Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.STRING ||
                      nodoIzq.type == Type.STRING && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (String(nodoIzq.value) + String(nodoDer.value)), 
                    type: Type.STRING 
                }
            //Condicional String + String
            }else if (nodoIzq.type == Type.STRING || nodoDer.type == Type.STRING ) {
                result = { 
                    value: (String(nodoIzq.value) + String(nodoDer.value)), 
                    type: Type.STRING 
                }
            } else {
                result = { 
                    value: (String(nodoIzq.value) + String(nodoDer.value)), 
                    type: Type.STRING 
                }
            }
            
        }else if (this.type == ArithmeticOptions.MENOS) {

   
            //Condicional Int - Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value - nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Int - double o Double - Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value - nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int - Char 
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value- (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            //Condicional Char - Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) - nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Douebl - Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value - nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble - Char 
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value - (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char - Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) - nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Char - Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) - (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            }
            
        }else if (this.type == ArithmeticOptions.MULT) {
   
            //Condicional Int * Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value * nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Int * double o Double * Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value * nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int * Char
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Char * Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Doueble * Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value * nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble * Char
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value  * (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char * Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) * nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Char * Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) * (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            }
            
        }else if (this.type == ArithmeticOptions.DIV) {
   
            //Condicional Int / Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value / nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Int / double o Double / Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value / nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int / Char
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value / (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            //Condicional Char / Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) /nodoDer.value), 
                    type: Type.INT 
                }
            //Condicional Doueble / Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value / nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble / Char
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value / (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char / Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) / nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Char / Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) / (nodoDer.value).charCodeAt(0)), 
                    type: Type.INT 
                }
            }
            
        }else if (this.type == ArithmeticOptions.POT) {
   
            //Condicional Int ** Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value ** nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int ** double o Double ** Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value ** nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int ** Char
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value ** (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char ** Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) ** nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble ** Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value ** nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble ** Char
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value ** (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char ** Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) ** nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Char ** Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) ** (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            }
            
        }else if (this.type == ArithmeticOptions.MOD) {
   
            //Condicional Int % Int
            if (nodoIzq.type == Type.INT && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value % nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int % double o Double % Int
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.DOUBLE ||
                      nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.INT) {
                result = { 
                    value: (nodoIzq.value % nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Int % Char
            }else if (nodoIzq.type == Type.INT && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value % (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char % Int
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.INT) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) % nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble % Double
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: (nodoIzq.value % nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Doueble % Char
            }else if (nodoIzq.type == Type.DOUBLE && nodoDer.type == Type.CHAR) {
                result = { 
                    value: (nodoIzq.value % (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            //Condicional Char % Double
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.DOUBLE) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) % nodoDer.value), 
                    type: Type.DOUBLE 
                }
            //Condicional Char % Char
            }else if (nodoIzq.type == Type.CHAR && nodoDer.type == Type.CHAR) {
                result = { 
                    value: ((nodoIzq.value).charCodeAt(0) % (nodoDer.value).charCodeAt(0)), 
                    type: Type.DOUBLE 
                }
            }
            
        }


        return result
    }
}