const { Router } = require('express');
var gramatica = require("../gramatica/gramatica");
const router = Router()

//incorporando gramatica


router.get('/', (req, res) => {
    res.json(lista);
});

router.get('/pb', (req, res) => {
    const data = {
        "name":"Oscar",
        "password":"oscar123"
    }
    res.json(data);
});

//----------------------------------------------------------------------------------
//-------------------------- Iniciando Gramática -----------------------------------
//----------------------------------------------------------------------------------

router.get('/gr', (req, res) => {
    var fs = require("fs");

    fs.readFile("./src/entrada.txt", (err, data) => {
        if (err) throw err;
        gramatica.parse(data.toString());
        res.json(gramatica.lista);

    });  
    

});

module.exports = router;


