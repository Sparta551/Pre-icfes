import {userModel} from "../model/userModel.js";

export const obtenerDatos=async (peticion,respuesta)=>{
    try{
        let usuarios= await userModel.find()
        respuesta.status(200).render("index",{usuarios})
    } catch (error){
        console.log(error);
    }
}

export const obtenerDatosNombre=async (peticion,respuesta)=>{
    try{
        if (nombre='Ana Lopez') {
        let usuarios= await userModel.find()
        respuesta.status(200).render("index",{usuarios})   
        }
        
    } catch (error){
        console.log(error);
    }
}

export const crearUsuarios = async(peticion,respuesta)=>{
    try{
        let data= peticion.body
        //guardar datos
        await userModel.create(data)
        //devuelva como respuesta una vista
        let usuarios= await userModel.Model.find()
        respuesta.status(200).render("index",{usuarios})
    } catch (error){
        console.log(error);
    }
}