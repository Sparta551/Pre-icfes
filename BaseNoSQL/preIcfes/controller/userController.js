import { userModel } from "../model/userModel.js";

/**
 * Obtener todos los usuarios
 */
export const obtenerTodosLosUsuarios = async (peticion, respuesta) => {
    try {
        let user = await userModel.find({
            estado: true // Filtrar solo usuarios activos
        }).sort({ nombre: 1 }); // Ordenar por nombre en orden ascendente

        respuesta.status(200).render("user/index", { user });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Obtener un usuario por ID
 */
export const obtenerUsuarioPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let user = await userModel.findById(id);

        if (!user) {
            return respuesta.status(404).render("usuarios/no_encontrado");
        }

        respuesta.status(200).render("usuarios/detalle", { user });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar un nuevo usuario
 */
export const agregarNuevoUsuario = async (peticion, respuesta) => {
    try {
        const { nombre, apellido, email } = peticion.body;

        // Crear un objeto con los datos del nuevo usuario
        const nuevoUsuario = new userModel({
            idUsuario: Date.now().toString(), // Asignar un ID único basado en el tiempo actual
            tipoDocUsuario: "N", // Asumiendo que el usuario proporciona su número ITIN
            documentoUsuario: null, // No se proporciona en la petición
            nombreUsuario: nombre,
            telefonoUsuario: null, // No se proporciona en la petición
            emailUsuario: email,
            direccionUsuario: null, // No se proporciona en la petición
            nivelEstudioUsuario: null, // No se proporciona en la petición
            regionalUsuario: null, // No se proporciona en la petición
            localidadUsuario: null, // No se proporciona en la petición
            estadoUsuario: true // Asumiendo que el nuevo usuario está activo por defecto
        });

        // Guardar el nuevo usuario en la base de datos
        await nuevoUsuario.save();

        respuesta.status(201).redirect("/usuarios");
    } catch (error) {
        console.error('Error al agregar nuevo usuario:', error);
        respuesta.status(500).json({ success: false, mensaje: 'Error interno del servidor' });
    }
};