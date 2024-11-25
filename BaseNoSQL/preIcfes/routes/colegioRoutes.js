import { Router } from "express";
import {obtenerTodosLosColegios,obtenerColegioPorId,agregarNuevoColegio} from "../controller/colegioController.js";

const router = Router()

router.get('/colegios', obtenerTodosLosColegios)
router.get('/colegios/:DANEcol', obtenerColegioPorId)
router.post('/colegios', agregarNuevoColegio)

export default router;
