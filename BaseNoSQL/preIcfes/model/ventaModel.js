import mongoose, { Schema } from "mongoose";

const ventaSchema = new Schema({
    idVenta: String,
    idColFK: String,
    idUsuarioFK: String,
    totalVenta: Number,
    fechaVenta: Date
});

export const ventaModel = new mongoose.model('Venta', ventaSchema)