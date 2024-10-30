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

//agregar las rutas para manipular user

const User=require('./user');

//registrar un nuevo usaurio 

app.post('/users', async(req,res)=>{
    try{
        const user=new User(req.body);
        await user.save();
        res.status(201).send(user);
    }
    catch(error){
        res.status(400).send(error)
    }
})

//consultar los usuarios
app.get('/users', async(req,res)=>{
    try{
        const user=await User.find();
        res.status(201).send(user);
    }
    catch(error){
        res.status(400).send(error)
    }
})

//consultar los usuarios por id 
app.get('/users/:id', async(req,res)=>{
    try{
        const user=await User.findById(req.params.id);
        if(!user)return response.staturs(404).send();
        res.status(201).send(user);
    }
    catch(error){
        res.status(500).send(error)
    }
})

//actualizar un suario
app.get('/users/:id', async(req,res)=>{
    try{
        const user=await User.findByIdAndUpdate(req.params.id,req.body,{new:true,runValidators:true});
        if(!user)return response.staturs(404).send();
        res.status(201).send(user);
    }
    catch(error){
        res.status(400).send(error)
    }
})
//eliminar usuario
app.get('/users/:id', async(req,res)=>{
    try{
        const user=await User.findByIdAndDelete(req.params.id);
        if(!user)return response.staturs(404).send();
        res.status(201).send(user);
    }
    catch(error){
        res.status(400).send(error)
    }
})