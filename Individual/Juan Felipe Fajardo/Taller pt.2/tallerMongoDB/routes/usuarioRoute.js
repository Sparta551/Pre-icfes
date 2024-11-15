import { Router } from "express";
import { crearDatos, modificarDetalleVenta, obtenerDatos } from "../controller/usuarioController.js";
const router = Router()

router.get('/usuarios', obtenerDatos)
router.post('/usuarios', crearDatos)
router.put('/usuarios/:_id', modificarDetalleVenta)


export default router;