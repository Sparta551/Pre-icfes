import { Router } from "express";
import {obtenerTodosLosProductos,obtenerProductoPorId,agregarNuevoProducto} from "../controller/productoController.js";
const router = Router()

router.get('/producto', obtenerTodosLosProductos)
router.post('/producto', obtenerProductoPorId)
router.post('/producto', agregarNuevoProducto)

export default router;
