import mongoose, { Schema } from "mongoose";

const dVentaSchema = new Schema({
    idVentaFK: String,
    idProductoFK: String,
    cantidadDVenta: Number,
    subtotalDVenta: Number,
    estadoDVenta: String
});

export const dVentaModel = new mongoose.model('dVentas', dVentaSchema)