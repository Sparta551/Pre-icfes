import { Router } from "express";
import {obtenerTodosLosProductos,obtenerProductoPorId,agregarNuevoProducto} from "../controller/productoController.js";
const router = Router()

router.post('/productos', agregarNuevoProducto);
router.get('/productos', obtenerTodosLosProductos);
router.get('/productos/:id', obtenerProductoPorId);

export default router;
