import { Router } from "express";
import {obtenerTodasLasVentas,obtenerVentaPorId,agregarNuevaVenta,calcularTotalVenta} from "../controller/ventaController.js";
const router = Router()

router.post('/ventas', agregarNuevaVenta);
router.get('/ventas', obtenerTodasLasVentas);
router.get('/ventas/:id', obtenerVentaPorId);
router.get('/ventas/total', calcularTotalVenta);

export default router;
