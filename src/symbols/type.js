"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Type = void 0;
var Type;
(function (Type) {
    Type[Type["INT"] = 0] = "INT";
    Type[Type["DOUBLE"] = 1] = "DOUBLE";
    Type[Type["CHAR"] = 2] = "CHAR";
    Type[Type["STRING"] = 3] = "STRING";
    Type[Type["BOOLEAN"] = 4] = "BOOLEAN";
    Type[Type["LET"] = 5] = "LET";
    Type[Type["VAR"] = 6] = "VAR";
    Type[Type["CONST"] = 7] = "CONST";
    Type[Type["error"] = 8] = "error";
})(Type = exports.Type || (exports.Type = {}));
