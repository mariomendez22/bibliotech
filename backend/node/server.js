require('module-alias/register');
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const http = require('http');

const routes = require('@routes/routes');

const app = express();
const server = http.createServer(app);

app.set('port', process.env.PORT || 8000);
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.get('/', (req, res) => {
    res.status(200).json({
        success: true,
        message: 'API BiblioTech funcionando correctamente'
    });
});
app.use('/api', routes);
app.use('*', (req, res) => {
    res.status(404).json({
        success: false,
        message: 'Ruta no encontrada'
    });

});

server.listen(app.get('port'), () => {
    console.log( `Server running on port ${app.get('port')}`);
});
module.exports = {
    app,
    server
};