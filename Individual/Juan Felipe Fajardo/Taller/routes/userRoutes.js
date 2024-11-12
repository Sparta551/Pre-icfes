import {Router} from "express"
import { crearUsuarios, obtenerDatos } from "../controller/userController.js"
const router=Router()

router.get('/usuarios', obtenerDatos)
router.post('/usuarios', crearUsuarios)

export default router;
