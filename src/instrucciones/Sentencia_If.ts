import { Instruccion } from "../abstract/instrucciones";

/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
class S_If extends Instruccion{
    constructor(
        public nombre: string,
        public tipo: string,
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