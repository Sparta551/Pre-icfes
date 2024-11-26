import { Router } from "express";
import {obtenerTodosLosColegios,obtenerColegioPorId,agregarNuevoColegio, eliminarColegioPorDane} from "../controller/colegioController.js";

const router = Router()

router.get('/colegios', obtenerTodosLosColegios)
router.get('/colegios/:DANEcol', obtenerColegioPorId)
router.post('/colegios', agregarNuevoColegio)
router.delete('/colegio/:DANEcol', eliminarColegioPorDane)

export default router;
