import {productosModel} from "../model/productosModel.js";

export const obtenerDatos=async (peticion,respuesta)=>{
    try{
        let productos= await productosModel.find()
        respuesta.status(200).render("index",{productos})
    } catch (error){
        console.log(error);
    }
}
export const crearProductos = async(peticion,respuesta)=>{
    try{
        let data= peticion.body
        //guardar datos
        await productosModel.create(data)
        //devuelva como respuesta una vista
        let usuarios= await productosModel.Model.find()
        respuesta.status(200).render("index",{productos})
    } catch (error){
        console.log(error);
    }
}