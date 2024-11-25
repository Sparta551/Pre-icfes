import { Router } from "express";
import {obtenerTodosLosUsuarios,obtenerUsuarioPorId,agregarNuevoUsuario} from "../controller/userController.js";
const router = Router()

router.post('/usuarios', agregarNuevoUsuario);
router.get('/usuarios', obtenerTodosLosUsuarios);
router.get('/usuarios/:id', obtenerUsuarioPorId);

export default router;
