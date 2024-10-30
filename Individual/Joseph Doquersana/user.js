//modelo para definir la manipulacion del modulo de usuario permitir manejar la tabla
const { default: mongoose } = require('mongoose');
const mongose=require('mongoose');

const userSchema=new mongoose.Schema({
    nombre:{
        type:String,
        require:true
    },
    edad:{
        type:Number,
        require:true
    },
    email:{
        type:String,
        require:true
    }
});
module.exports=mongoose.model('user',userSchema);

