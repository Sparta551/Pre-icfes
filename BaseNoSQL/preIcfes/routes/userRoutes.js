import { Router } from "express";
import {obtenerTodosLosUsuarios,obtenerUsuarioPorId,agregarNuevoUsuario} from "../controller/userController.js";
const router = Router()

router.get('/user', obtenerTodosLosUsuarios)
router.get('/user.id', obtenerUsuarioPorId)
router.post('/user', agregarNuevoUsuario)

export default router;
