import mongoose, {Schema} from "mongoose";

const productosSchema= new Schema({
    nombre:String,
    precio:String,
    categoria:String
})

export const productosModel=new mongoose.model('Productos',productosSchema)