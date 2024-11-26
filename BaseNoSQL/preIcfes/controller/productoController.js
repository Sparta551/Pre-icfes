import { productoModel } from "../model/productoModel.js";

/**
 * Agregar un nuevo producto
 */
export const agregarNuevoProducto = async (peticion, respuesta) => {
    try {
        const data = peticion.body;

        const nuevoProducto = new productoModel(data);
        await nuevoProducto.save();

        respuesta.status(201).send(nuevoProducto);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al agregar el producto.' });
    }
};

/**
 * Obtener todos los productos
 */
export const obtenerTodosLosProductos = async (peticion, respuesta) => {
    try {
        const productos = await productoModel.find();
        
        respuesta.status(200).json(productos);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener los productos.' });
    }
};

/**
 * Obtener un producto por ID
 */
export const obtenerProductoPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        const producto = await productoModel.findById(id);
        respuesta.status(200).json(producto);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener el producto.' });
    }
};

/**
 * Desactivar un producto por ID
 */
export const desactivarProducto = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        const result = await productoModel.findOneAndUpdate({ _id: id }, { $set: { estadoProducto: 0 } }, { new: true });

        respuesta.status(200).json(result);

    } catch (error) {
        console.error(error);
        respuesta.status(500).json({ message: 'Ocurrió un error al actualizar el estado del producto' });
    }
};

/**
 * Cambiar el precio de un producto
 */
export const cambiodePrecioProducto = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        const { precioProducto } = peticion.body;

        const result = await productoModel.findOneAndUpdate({ _id: id }, { $set: { precioProducto } }, { new: true });

        respuesta.status(200).json(result);

    } catch (error) {
        console.error(error);
        respuesta.status(500).json({ message: 'Ocurrió un error al actualizar el estado del producto' });
    }
};