const router = require('express').Router();
const controller = require('@controllers/libros.controller');

router.get('/', controller.getAll);
router.get(
    '/:id/ejemplares',
    controller.getEjemplares
);

module.exports = router;