import mongoose, { Schema } from "mongoose";

const ventaSchema = new Schema({
    totalVenta: Number,
    fechaVenta: Date
});

export const ventaModel = new mongoose.model('Venta', ventaSchema)