import mongoose, { Schema } from "mongoose";

const userSchema = new Schema({
    idUsuario: String,
    tipoDocUsuario: String,
    documentoUsuario: Number,
    nombreUsuario: String,
    telefonoUsuario: String,
    emailUsuario: String,
    direccionUsuario: String,
    nivelEstudioUsuario: String,
    regionalUsuario: String,
    localidadUsuario: String,
    estadoUsuario: Boolean
});

export const userModel = new mongoose.model('Users', userSchema)