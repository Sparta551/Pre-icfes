import { config } from "dotenv"
import express, {json} from "express"

import {connectDB} from "./config/database.js"
import userRoutes from "./routes/userRoutes.js"
import productosRoutes from "./routes/productosRoutes.js"
config()

//Conexion a la BD
connectDB()
.then(()=>{
    console.log("Conexion a la base de datos exitosa")
})
.catch(()=>{
    console.log("Error al conectar con la base de datos")
    process.exit(1)
})

//configurar el servidor
const server=express()
const PORT=process.env.PORT

server.use(express.urlencoded({extended:true}));
server.use(express.static('public'))
//configurar las rutas de acceso

server.use(userRoutes)
server.use(productosRoutes)

server.listen(PORT, ()=> console.log(`Server running en port ${PORT}`))