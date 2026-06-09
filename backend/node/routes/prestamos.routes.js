const router = require('express').Router();
const controller = require('@controllers/prestamos.controller');

router.post('/', controller.create);
router.get('/activos',controller.getActivos);
router.put( '/:id/devolucion', controller.devolver );
router.get('/historico', controller.getHistorico);
module.exports = router;