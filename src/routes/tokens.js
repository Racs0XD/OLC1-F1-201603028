const { Router } = require('express');
const router = Router();

const tokens = require('../tokens.json');

router.get('/',(req, res) => {
    res.json(tokens);
})



module.exports = router;