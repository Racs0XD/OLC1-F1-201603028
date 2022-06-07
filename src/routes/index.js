const { Router } = require('express');
const router = Router()

router.get('/', (req, res) => {
    res.json({"Title":"Hola Mundo"});
});

router.get('/pb', (req, res) => {
    const data = {
        "name":"Oscar",
        "password":"oscar123"
    }
    res.json(data);
});

module.exports = router;