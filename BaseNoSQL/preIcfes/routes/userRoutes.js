import { Router } from "express";
import {obtenerTodosLosUsuarios,obtenerUsuarioPorId,agregarNuevoUsuario} from "../controller/userController.js";
const router = Router()

router.get('/Users', obtenerTodosLosUsuarios)
router.get('/Users', obtenerUsuarioPorId)
router.post('/Users', agregarNuevoUsuario)

export default router;
