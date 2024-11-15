import { colegioModel } from "../model/colegioModel.js";

/**
 * Obtener todos los colegios
 */
export const obtenerTodosLosColegios = async (peticion, respuesta) => {
    try {
        let colegios = await colegioModel.find().populate('idColFK'); // Relacionar con el modelo relacionado

        respuesta.status(200).render("colegios/index", { colegios });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Obtener un colegio por ID
 */
export const obtenerColegioPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let colegio = await colegioModel.findById(id).populate('idColFK');

        if (!colegio) {
            return respuesta.status(404).render("colegios/no_encontrado");
        }

        respuesta.status(200).render("colegios/detalle", { colegio });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar un nuevo colegio
 */
export const agregarNuevoColegio = async (peticion, respuesta) => {
    try {
        const { nombre, direccion } = peticion.body;

        // Crear un objeto con los datos del nuevo colegio
        const nuevoColegio = new colegioModel({
            idCol: Date.now().toString(), // Asignar un ID único basado en el tiempo actual
            DANECol: 0, // Asumiendo que no se proporciona este dato en la petición
            nombreCol: nombre,
            nivelAcademicoCol: "", // Asumiendo que no se proporciona este dato en la petición
            estratoSocioeconoCol: null, // Asumiendo que no se proporciona este dato en la petición
            cantidadEstudiantesCol: null // Asumiendo que no se proporciona este dato en la petición
        });

        // Guardar el nuevo colegio en la base de datos
        await nuevoColegio.save();

        respuesta.status(201).redirect("/colegios");
    } catch (error) {
        console.error('Error al agregar nuevo colegio:', error);
        respuesta.status(500).json({ success: false, mensaje: 'Error interno del servidor' });
    }
};