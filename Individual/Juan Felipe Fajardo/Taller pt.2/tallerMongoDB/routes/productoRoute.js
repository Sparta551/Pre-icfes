import { Router } from "express";
import { crearDatos, obtenerDatos } from "../controller/productoController.js";
const router = Router()

router.get('/productos', obtenerDatos)
router.post('/productos', crearDatos)


export default router;