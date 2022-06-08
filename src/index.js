const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const app = express();

//configuraciones
// process.env.PORT tomará el puerto que proporciona la nuve si este de despliega
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 2);

//middlewars funcion que procesa datos antes de que el servidor lo reciba
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// rutas
app.use(require('./routes/index'));
app.use('/api/tokens',require('./routes/tokens'));
app.use('/api/errores',require('./routes/errores'));


//iniciando servidor
app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
});

