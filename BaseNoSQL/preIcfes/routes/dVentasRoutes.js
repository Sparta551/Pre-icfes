import { Router } from "express";
import {obtenerDetallesVenta,obtenerDetallesVentaPorId,agregarNuevoDetalleVenta} from "../controller/dVentasController.js";
const router = Router()

router.get('/dVentas', obtenerDetallesVenta)
router.get('/dVentas/:id', obtenerDetallesVentaPorId)
router.post('/dVentas', agregarNuevoDetalleVenta)

export default router;
