import mongoose, {Schema} from "mongoose";

const userSchema= new Schema({
    nombre: String,
    edad: Number,
    email: String
})

export const usuarioModel=new mongoose.model('Usuarios',userSchema)