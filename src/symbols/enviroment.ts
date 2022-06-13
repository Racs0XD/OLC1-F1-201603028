import { Symb } from "./symbols";
import { Type } from "./type";

export class Environment {
  
  private tablaSimbolos: Map<string, Symb>; //unicamente para variables, tienes q guardar funciones en otro map 
  
  constructor(public anterior: Environment | null) {
    this.tablaSimbolos = new Map();
  }

  public getEnv(){
    return this.tablaSimbolos
  }

  public guardar_variable(identificador: string, valor: any, type: Type): boolean {
    
    if(!this.buscar_variable(identificador)){
      this.tablaSimbolos.set(identificador, new Symb(valor, identificador, type));
      return true
    }
    console.log("esta variable ["+identificador+"] ya existe...");
    return false
  }

  public buscar_variable(nombre: string): boolean {
    for (let entry of Array.from(this.tablaSimbolos.entries())) {
        if (entry[0] == nombre) return true;
    }
    return false
  }
  public getTipo_variable(nombre: string): Type {
    for (let entry of Array.from(this.tablaSimbolos.entries())) {
        if (entry[0] == nombre) return entry[1].type;
    }
    return Type.error
  }
  public actualizar_variable(nombre: string, new_valor: any) {
    for (let entry of Array.from(this.tablaSimbolos.entries())) {
      if (entry[0] == nombre) {
          entry[1].value = new_valor;
      }
  }
  }
  
}
