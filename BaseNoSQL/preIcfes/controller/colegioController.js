import { colegioModel } from "../model/colegioModel.js";

/**
 * Agregar un nuevo colegio
 */
export const agregarNuevoColegio = async (peticion, respuesta) => {
    try {
        const data =peticion.body;

        const nuevoColegio = new colegioModel(data);
        await nuevoColegio.save();

        respuesta.status(201).send(nuevoColegio);
    } catch (error) {
        console.log(error);
    }
};


/**
 * Obtener todos los colegios
 */
export const obtenerTodosLosColegios = async (peticion, respuesta) => {
    try {
        const colegios = await colegioModel.find();
        
        respuesta.status(200).json(colegios);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener los colegios.' });
    }
};

/**
 * Obtener un colegio por ID
 */
export const obtenerColegioPorId = async (peticion, respuesta) => {
    try {
 
        const { data } = peticion.params;

        const colegio = await colegioModel.findOne({ DANEcol: data });
        respuesta.status(200).json(colegio);

    } catch (error) {
        console.log(error);
    }
};


