import { userModel } from "../model/userModel.js";

/**
 * Agregar un nuevo usuario
 */
export const agregarNuevoUsuario = async (peticion, respuesta) => {
    try {
        const data = peticion.body;

        const nuevoUsuario = new userModel(data);
        await nuevoUsuario.save();

        respuesta.status(201).send(nuevoUsuario);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al agregar el usuario.' });
    }
};

/**
 * Obtener todos los usuarios
 */
export const obtenerTodosLosUsuarios = async (peticion, respuesta) => {
    try {
        const usuarios = await userModel.find();
        
        respuesta.status(200).json(usuarios);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener los usuarios.' });
    }
};

/**
 * Obtener un usuario por ID
 */
export const obtenerUsuarioPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        const usuario = await userModel.findById(id);

        respuesta.status(200).json(usuario);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener el usuario.' });
    }
};
