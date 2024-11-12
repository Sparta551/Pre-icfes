import mongoose, {Schema} from "mongoose";

const userSchema= new Schema({
    nombre:String,
    edad:String,
    email:String
})

export const userModel=new mongoose.model('Users',userSchema)