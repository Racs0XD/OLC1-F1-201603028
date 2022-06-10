export const AST = class AST {
    constructor({ label = 'SIN ETIQUETA', son = [], line = 0} = {}) {
      this.label = label;
      this.son = son;
      this.line = line;
    }
}
  
  