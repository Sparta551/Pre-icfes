import { Router } from 'express';
import { obtenerDatos, agregarNuevo } from '../controller/colegioDesController.js';

const router = Router();

router.get('/colegioDes', obtenerDatos);
router.post('/colegioDes', agregarNuevo);

module.exports = router;
