import { productoModel } from "../model/productoModel.js";

/**
 * Obtener todos los productos
 */
export const obtenerTodosLosProductos = async (peticion, respuesta) => {
    try {
        let productos = await productoModel.find({
            precio: { $gt: 100 } // Filtrar productos cuyo precio sea mayor a 100
        }).sort({ precio: -1 }); // Ordenar por precio en orden descendente

        respuesta.status(200).render("productos/index", { productos });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Obtener un producto por ID
 */
export const obtenerProductoPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let producto = await productoModel.findById(id);


        respuesta.status(200).render("productos/detalle", { producto });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar un nuevo producto
 */
export const agregarNuevoProducto = async (peticion, respuesta) => {
    try {
        const { nombre, tipo, precio } = peticion.body;

        // Crear un objeto con los datos del nuevo producto
        const nuevoProducto = new productoModel({
            tipoProducto: tipo,
            nombreProducto: nombre,
            precioProducto: precio,
            anioProducto: null, // Asumiendo que no se proporciona este dato en la petición
            estadoProducto: true // Asumiendo que el nuevo producto está activo por defecto
        });

        // Guardar el nuevo producto en la base de datos
        await nuevoProducto.save();

        respuesta.status(201).redirect("/productos");
    } catch (error) {
        console.error('Error al agregar nuevo producto:', error);
        respuesta.status(500).json({ success: false, mensaje: 'Error interno del servidor' });
    }
};
