const router = require('express').Router();
const controller = require('@controllers/socios.controller');

router.get('/', controller.getAll);

module.exports = router;