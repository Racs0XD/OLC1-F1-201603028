const { Router } = require('express');
var gramatica = require("../../gramatica");
const router = Router()

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

module.exports = router;