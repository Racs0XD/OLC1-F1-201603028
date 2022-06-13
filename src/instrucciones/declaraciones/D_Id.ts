import { Instruccion } from "../../abstract/instrucciones";
import { Environment } from "../../symbols/enviroment";

/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
export class D_Id extends Instruccion{
    constructor(
        public tipo_declaracion: string,
        public identificador: string,
        line: number,
        column: number
        //public expresion: Expresion
    ) {
        super(line,column);
    }
        public execute(Env: Environment) {
            //codigo analisis semantico
        }
}


