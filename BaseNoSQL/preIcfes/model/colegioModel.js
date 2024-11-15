import mongoose, { Schema } from "mongoose";

const colegioSchema = new Schema({
    DANECol: Number,
    nombreCol: String,
    nivelAcademicoCol: String,
    estratoSocioeconoCol: Number,
    cantidadEstudiantesCol: Number
});

export const colegioModel = new mongoose.model('colegio', colegioSchema)