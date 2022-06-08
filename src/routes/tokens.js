const { Router } = require('express');
const router = Router();

router.get('/',(req, res) => {
    res.send('tokens');
})

module.exports = router;