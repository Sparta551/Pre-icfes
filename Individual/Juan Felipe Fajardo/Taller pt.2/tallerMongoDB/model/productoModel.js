import mongoose, { Schema } from "mongoose";

const productoSchema = new Schema({
    nombre: String,
    precio: Number,
    categoria: String
})

export const productosModel = new mongoose.model('Productos', productoSchema)