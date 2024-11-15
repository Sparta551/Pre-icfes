import { userModel } from "../model/userModel.js";

/**
 * Obtener todos los usuarios
 */
export const obtenerTodosLosUsuarios = async (peticion, respuesta) => {
    try {
        const users = await userModel.find({ estado: true })
            .sort({ nombre: 1 });

        respuesta.status(200).json(users);
    } catch (error) {
        console.error('Error al obtener usuarios:', error);
        respuesta.status(500).json({ error: 'Ocurrió un error al procesar la solicitud' });
    }
};

/**
 * Obtener un usuario por ID
 */
export const obtenerUsuarioPorId = async (peticion, respuesta) => {
    try {
        let _id = peticion.params;
        let user = await userModel.findById({_id});


        respuesta.status(200).render("user/detalle", { user });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar un nuevo usuario
 */
export const agregarNuevoUsuario = async (peticion, respuesta) => {
    try {
        // Extraer los datos de la petición
        const {
            tipoDocUsuario,
            documentoUsuario,
            nombreUsuario,
            telefonoUsuario,
            emailUsuario,
            direccionUsuario,
            nivelEstudioUsuario,
            regionalUsuario,
            localidadUsuario
        } = peticion.body;

        // Crear un objeto con los datos del nuevo usuario
        const nuevoUsuario = new userModel({
            tipoDocUsuario: tipoDocUsuario || "N",
            documentoUsuario: documentoUsuario,
            nombreUsuario: nombreUsuario,
            telefonoUsuario: telefonoUsuario,
            emailUsuario: emailUsuario,
            direccionUsuario: direccionUsuario,
            nivelEstudioUsuario: nivelEstudioUsuario,
            regionalUsuario: regionalUsuario || null,
            localidadUsuario: localidadUsuario || null,
            estadoUsuario: true // Asumiendo que el nuevo usuario está activo por defecto
        });

        // Guardar el nuevo usuario en la base de datos
        await nuevoUsuario.save();

        respuesta.status(201).json({
            success: true,
            mensaje: 'Usuario agregado con éxito',
            id: nuevoUsuario.id
        });
    } catch (error) {
        console.error('Error al agregar nuevo usuario:', error);
        respuesta.status(500).json({ success: false, mensaje: 'Error interno del servidor' });
    }
};