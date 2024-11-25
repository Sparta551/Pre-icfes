import { ventaModel } from "../model/ventaModel.js";


/**
 * Agregar una nueva venta
 */
export const agregarNuevaVenta = async (peticion, respuesta) => {
    try {
        const data = peticion.body;

        const nuevaVenta = new ventaModel(data);
        await nuevaVenta.save();

        respuesta.status(201).send(nuevaVenta);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al agregar la venta.' });
    }
};

/**
 * Obtener todas las ventas
 */
export const obtenerTodasLasVentas = async (peticion, respuesta) => {
    try {
        const ventas = await ventaModel.find();
        
        respuesta.status(200).json(ventas);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener las ventas.' });
    }
};

/**
 * Obtener una venta por ID
 */
export const obtenerVentaPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        const venta = await ventaModel.findById(id);

        respuesta.status(200).json(venta);
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ mensaje: 'Hubo un error al obtener la venta.' });
    }
};

/**
 * Calcular el total de una venta
 */
export const calcularTotalVenta = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let detalles = await dVentaModel.find({ idVentaFK: id });

        let total = detalles.reduce((total, detalle) =>
            total + (detalle.cantidad * detalle.precioUnitario), 0);

        respuesta.status(200).json({ success: true, total });
    } catch (error) {
        console.log(error);
    }
};