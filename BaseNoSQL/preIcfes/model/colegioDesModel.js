import mongoose, { Schema } from "mongoose";

const colegioDesSchema = new Schema({
    idUsuarioFK: String,
    idColFK: String,
    dificultadDes: Number,
    intencionDes: String,
    quienDecDes: String,
    contactoDes: Number,
    obsDes: String,
    desvDes: Number,
    fechaDes: Date
});

export const colegioDesModel = new mongoose.model('colegioDes', colegioDesSchema)