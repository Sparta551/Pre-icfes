import { Router } from "express";
import {obtenerTodosLosUsuarios,desactivarUsuario,agregarNuevoUsuario} from "../controller/userController.js";
const router = Router()

router.post('/usuarios', agregarNuevoUsuario)
router.get('/usuarios', obtenerTodosLosUsuarios)
router.get('/usuarios/:id', desactivarUsuario)

export default router;
