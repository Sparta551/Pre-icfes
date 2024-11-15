import mongoose, { Schema } from "mongoose";

const productoSchema = new Schema({
    idProducto: String,
    tipoProducto: String,
    nombreProducto: String,
    precioProducto: Number,
    anioProducto: Number,
    estadoProducto: Boolean
});

export const productoModel = new mongoose.model('Producto', productoSchema)