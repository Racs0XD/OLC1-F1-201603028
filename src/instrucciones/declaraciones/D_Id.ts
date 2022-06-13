import { Instruccion } from "../../abstract/instrucciones";

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
        public execute() {
            //codigo analisis semantico
        }
}


