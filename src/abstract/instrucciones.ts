import { Environment } from "../symbols/enviroment";

/*  export permite que otros accedan a esta clase 
    abstract convierte en clase abstracta
*/
export abstract class Instruccion { 
    constructor(
        public line: number,
        public column: number
    ) {
        this.line = line;
        this.column = column+1;
    }

    public abstract execute(env: Environment):any
}