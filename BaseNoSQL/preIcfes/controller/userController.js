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
 * Desactivar un usuario por ID
 */
export const desactivarUsuario = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        const result = await userModel.findOneAndUpdate({ _id: id }, { $set: { estadoUsuario: 0 } }, { new: true });

        respuesta.status(200).json(result);

    } catch (error) {
        console.error(error);
        respuesta.status(500).json({ message: 'Ocurrió un error al actualizar el estado del producto' });
    }
};


export const buscarUsuarioRegional = async (peticion, respuesta) => {
    try {
        const { regional } = peticion.params;

        const result = await userModel.find({regionalUsuario: regional});

        respuesta.status(200).json(result);

    } catch (error) {
        console.error(error);
        respuesta.status(500).json({ message: 'Ocurrió un error al actualizar el estado del producto' });
    }
};