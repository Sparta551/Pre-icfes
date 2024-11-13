import { Router } from "express";
import {obtenerVentas,obtenerVentaPorId,agregarNuevaVenta} from "../controller/ventaController.js";
const router = Router()

router.get('/Venta', obtenerVentas)
router.get('/Venta/:id', obtenerVentaPorId)
router.post('/Venta', agregarNuevaVenta)

export default router;
