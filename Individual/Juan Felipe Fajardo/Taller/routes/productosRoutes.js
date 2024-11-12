import { Router } from "express"
import { crearProductos, obtenerDatos } from "../controller/productosController.js"
const router=Router()

router.get('/productos', obtenerDatos)
router.post('/productos', crearProductos)

export default router;
