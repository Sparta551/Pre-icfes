import { Router } from "express";
import {obtenerTodosLosColegios,obtenerColegioPorId,obtenerColegiosPorNombre} from "../controller/collegeController.js";
const router = Router()

router.get('/colegios', obtenerTodosLosColegios)
router.post('/colegios', obtenerColegioPorId)
router.post('/colegios', obtenerColegiosPorNombre)

export default router;
