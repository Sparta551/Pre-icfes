import { dVentaModel } from "../model/dVentaModel.js";
/**
 * Obtener detalles de una venta específica
 */
export const obtenerDetallesVenta = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        let detalles = await dVentaModel.find({ idVentaFK: id }).populate('idProductoFK');

        if (!detalles || detalles.length === 0) {
            return respuesta.status(404).render("ventas/detalles/no_encontrados");
        }

        respuesta.status(200).render("ventas/detalles/index", { detalles });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Agregar un detalle a una venta existente
 */
export const agregarDetalleVenta = async (peticion, respuesta) => {
    try {
        const { idVentaFK, idProductoFK, cantidad, precioUnitario } = peticion.body;
        const nuevoDetalle = new dVentaModel({
            idVentaFK: idVentaFK,
            idProductoFK: idProductoFK,
            cantidad: cantidad,
            precioUnitario: precioUnitario
        });

        await nuevoDetalle.save();
        respuesta.status(201).redirect(`/ventas/detalle/${idVentaFK}`);
    } catch (error) {
        console.log(error);
    }
};

/**
 * Modificar el detalle de una venta específica
 */
export const modificarDetalleVenta = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        const { cantidad, precioUnitario } = peticion.body;

        let detalleModificado = await dVentaModel.findByIdAndUpdate(id,
            { $set: { cantidad, precioUnitario } },
            { new: true }
        );

        if (!detalleModificado) {
            return respuesta.status(404).json({ success: false, mensaje: 'Detalle no encontrado' });
        }

        respuesta.status(200).json({ success: true, detalle: detalleModificado });
    } catch (error) {
        console.log(error);
    }
};

/**
 * Eliminar un detalle específico de una venta
 */
export const eliminarDetalleVenta = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;

        let detalleEliminado = await dVentaModel.findByIdAndRemove(id);

        if (!detalleEliminado) {
            return respuesta.status(404).json({ success: false, mensaje: 'Detalle no encontrado' });
        }

        respuesta.status(200).json({ success: true, mensaje: 'Detalle eliminado con éxito' });
    } catch (error) {
        console.log(error);
    }
};
