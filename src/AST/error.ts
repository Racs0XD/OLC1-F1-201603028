export class Error {
    tipo!: string;
    linea!: string;
    desc!: string;

    constructor({tipo,linea,desc}:{tipo: string, linea: string, desc: string}){
        const valor = linea;
        Object.assign(this, {tipo, linea: valor.toString(), desc})
    }
    
}