import { Expression } from "../abstract/express";
import { Retorno } from "../abstract/Retorno";
import { Type } from "../symbols/type";

export class Literal extends Expression {
    constructor(
        private value: any,
        private type: Type,
        line: number,
        column: number
    ){ 
        super(line,column)
    }

    public execute(): Retorno{

        if (this.type == Type.INT)          return { value: Number(this.value), type: Type.INT }
        else if (this.type == Type.DOUBLE)  return { value: Number(this.value), type: Type.DOUBLE }
        else if (this.type == Type.CHAR){
                                            this.value = (this.value).replaceAll("\'","")
                                            return { value: this.value, type: Type.CHAR }
        } 
        else if (this.type == Type.STRING){
                                            this.value = (this.value).replaceAll("\"","")
                                            return { value: this.value, type: Type.STRING }
        } 
        else if (this.type == Type.BOOLEAN){
            if (this.value == "true" )      return { value: Boolean(true), type: Type.BOOLEAN }
            else                            return { value: Boolean(false), type: Type.BOOLEAN }
          
        } 
        else if (this.type == Type.VAR){     return { value: this.value, type: Type.VAR }
        } 
        else if (this.type == Type.LET){     return { value: this.value, type: Type.LET }
        }         
        else if (this.type == Type.CONST){   return { value: this.value, type: Type.CONST }
        }
        else return { value: this.value, type: Type.error }
        
    }
}