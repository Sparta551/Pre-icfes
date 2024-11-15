import { productosModel } from "../model/productoModel.js";

export const obtenerDatos = async (peticion, respuesta) => {
    try {
        let productos = await productosModel.find()
        respuesta.status(200).render("index", { productos })
    } catch (error) {
        console.log(error);
    }
}
export const crearDatos = async (peticion, respuesta) => {
    try {
        let data = peticion.body
        // Guardar datos
        await productosModel.create(data)
        // devuelve la vista al usuario para vea los nuevos datos
        let productos = await productosModel.find()
        respuesta.status(200).render("index", {productos})
    } catch (error) {
        console.log(error);
    }
}