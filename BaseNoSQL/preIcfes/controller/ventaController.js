import { ventaModel } from "../model/ventaModel.js";


/**
 * Obtener todas las ventas
 */
export const obtenerVentas = async (peticion, respuesta) => {
    try {
        let ventas = await ventaModel.find().populate('idColFK').populate('idUsuarioFK');
        respuesta.status(200).render("ventas/index", { ventas });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Obtener una venta por ID
 */
export const obtenerVentaPorId = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let venta = await ventaModel.findById(id).populate('idColFK').populate('idUsuarioFK');


        respuesta.status(200).render("ventas/detalle", { venta });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar una nueva venta
 */
export const agregarNuevaVenta = async (peticion, respuesta) => {
    try {
        const {totalVenta, fechaVenta } = peticion.body;

        const nuevaVenta = new ventaModel({
            totalVenta: totalVenta,
            fechaVenta: fechaVenta || new Date()
        });

        await nuevaVenta.save();
        respuesta.status(201).json({ message: "Venta agregada con éxito", venta: nuevaVenta });
    } catch (error) {
        console.log(error);
        respuesta.status(500).json({ error: "Error al agregar la venta" });
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