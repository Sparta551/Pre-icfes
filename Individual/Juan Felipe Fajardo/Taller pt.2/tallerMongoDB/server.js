import { config } from "dotenv"
import express, {json} from "express"
import path from "path"

import { __dirname } from "./util/__dirname.js"
import {connectDB} from "./config/database.js"
import usuarioRoute from "./routes/usuarioRoute.js"
import productoRoute from "./routes/productoRoute.js"
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

server.set('view engine', 'ejs');
server.set('views', path.join(__dirname, 'views'));
server.use(json())

server.use(usuarioRoute)
server.use(productoRoute)

server.listen(PORT, ()=> console.log(`Server running in port ${PORT}`))