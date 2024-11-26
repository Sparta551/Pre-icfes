import { Router } from "express";
import {obtenerTodosLosProductos,obtenerProductoPorId,agregarNuevoProducto,desactivarProducto, cambiodePrecioProducto} from "../controller/productoController.js";
const router = Router()

router.post('/productos', agregarNuevoProducto)
router.get('/productos', obtenerTodosLosProductos)
router.get('/productos/:id', obtenerProductoPorId)
router.put('/productos/desactivar/:id', desactivarProducto)
router.put('/producto/:id', cambiodePrecioProducto)

export default router;
