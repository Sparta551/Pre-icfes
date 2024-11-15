import { colegioDesModel } from "../model/colegioDesModel.js";

export const obtenerDatos = async (peticion, respuesta) => {
    try {
        let colegios = await colegioDesModel.find();
        respuesta.status(200).json(colegios);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ error: "Error al obtener los datos" });
    }
};

export const agregarNuevo = async (peticion, respuesta) => {
    try {
        const nuevoColegio = new colegioDesModel(peticion.body);
        await nuevoColegio.save();
        respuesta.status(201).json(nuevoColegio);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ error: "Error al agregar el registro" });
    }
};
