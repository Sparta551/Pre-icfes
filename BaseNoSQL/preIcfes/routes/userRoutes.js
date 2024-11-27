import { Router } from "express";
import {obtenerTodosLosUsuarios,desactivarUsuario,agregarNuevoUsuario,buscarUsuarioRegional} from "../controller/userController.js";
const router = Router()

router.post('/usuarios', agregarNuevoUsuario)
router.get('/usuarios', obtenerTodosLosUsuarios)
router.get('/usuarios/:id', desactivarUsuario)
router.get('/Usuario/:regionalUsuario', buscarUsuarioRegional)

export default router;
