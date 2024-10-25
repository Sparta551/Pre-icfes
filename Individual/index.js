//conexion a la base de datos 
const express=require('express');
const mongosee=require('mongoose');

const app=express();
const PORT=3000;

//crear el cuerpo de las peticiones (Middleware)
app.use(express.json());

//conexion base de datos 
mongosee.connect('mongodb://localhost:27017/MongoDB',{
    useNewURLParser:true,
    useUnifiedTopology:true
}).then(()=>console.log('se conecto a MongoDB'))
.catch(err=>console.error('nose conecto a BD:',err));
//inica el servidor 
app.listen(PORT,()=>{
    console.log('servidor ejecutandose sobre el puerto;,${PORT}');
});