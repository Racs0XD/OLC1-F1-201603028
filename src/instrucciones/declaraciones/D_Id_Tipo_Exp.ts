import { Expression } from "../../abstract/express";
import { Instruccion } from "../../abstract/instrucciones";
import { Environment } from "../../symbols/enviroment";

/*  para una declaración se necesita el tipo de dato, el nombre de la variable y su expresión */
export class D_Id_Tipo_Exp extends Instruccion{
    constructor(
        public tipo_declaracion: string,
        public identificador: string,
        public tipo: string,
        public expresion: Expression,
        line: number,
        column: number
        //public expresion: Expresion
    ) {
        super(line,column);
    }
        public execute(Env: Environment) {
            //codigo analisis semantico
            console.log("Declarando nueva variable: "+ this.identificador);
            console.log(this);

            const x = this.expresion.execute(Env);
        }
}
