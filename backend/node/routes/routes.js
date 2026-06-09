const router = require('express').Router();

router.get('/', (req, res) => {
    res.json({
        message: 'API funcionando'
    });
});

router.use( '/auth', require('./auth.routes') );
router.use('/socios', require('./socios.routes'));
router.use('/libros', require('./libros.routes'));
router.use('/prestamos', require('./prestamos.routes'));


module.exports = router;