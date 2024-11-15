import { usuarioModel } from "../model/usuarioModel.js";

export const obtenerDatos = async (peticion, respuesta) => {
    try {
        let usuarios = await usuarioModel.find()
        respuesta.status(200).render("index", { usuarios })
    } catch (error) {
        console.log(error);
    }
}

export const crearDatos = async (peticion, respuesta) => {
    try {
        let data = peticion.body
        // Guardar datos
        await usuarioModel.create(data)
        // devuelve la vista al usuario para vea los nuevos datos
        let usuarios = await usuarioModel.find()
        respuesta.status(200).render("index", { usuarios })
    } catch (error) {
        console.log(error);
    }
}




export const eliminarDatos = async (peticion, respuesta) => {
    try {
        const { nombre } = peticion.params;

        let detalleEliminado = await usuarioModel.findByIdAndRemove(nombre);

        if (!detalleEliminado) {
            return respuesta.status(404).json({ success: false, mensaje: 'No se encontro el detalle' });
        }

        respuesta.status(200).json({ success: true, detalle: 'Detalle eliminado con exito' });
    } catch (error) {
        console.log(error);
    }
};

export const modificarDetalleVenta = async (peticion, respuesta) => {
    try {
        const { id } = peticion.params;
        const { edad } = peticion.body;

        let detalleModificado = await dVentaModel.findByIdAndUpdate(id,
            { $set: { edad } },
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