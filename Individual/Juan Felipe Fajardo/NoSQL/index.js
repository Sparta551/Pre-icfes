//conexion a BD
const express=require('express');
const mongoose=require('mongoose');

const app=express();
const PORT=3000; //puerto default

//crear el cuerpo de las peticiones (Middleware)
app.use(express.json());

//conexion (ahora si)
mongoose.connect('wataga://localhost:27017/Mongolo',{ //sintaxys es moongose.connect('#')
    useNewURLParser:true,
    useUnifiedTopology:true
}
).then(()=>console.log('Se hizo la coneccion con la base de datos'))
.catch(err=>console.error('Wuak wuak, no se conecto error: ',err));

//iniciar el servidor
app.listen(PORT,()=>{
    console.log('Servidor ejecutandose sobre el puerto: ${PORT}');
}
);

//Agregar las rutas para manipular user

const User=require ('./Usuario/User');

//registrar un usuario nuevo

app.post('/users',async(req,res)=>{
    try{
        const user=newUser(req.body);
        await user.save();
        res.status(201).send(user);
    }
    catch (error){
        res.status(400).send(error);

    }
})

//consultar los usuarios

app.get('/users',async(req,res)=>{
    try{
        const users=await User.find();
        res.status(201).send(users);
    }
    catch (error){
        res.status(500).send(error);

    }
})

//Consultar usuario por id

app.get('/users/:id',async(req,res)=>{
    try{
        const users=await User.findById(req.params.id);
        if(!user) return res.status(404).send();
        res.status(201).send(users);
    }
    catch (error){
        res.status(500).send(error);

    }
})

//Actualizar un usuario por id

app.get('/users/:id',async(req,res)=>{
    try{
        const users=await User.findByIdandUpdate(req.params.id,req.body,{new:true,runValidators:true});
        if(!user) return res.status(404).send();
        res.status(201).send(users);
    }
    catch (error){
        res.status(400).send(error);

    }
})

//Eliminar un usuario por id

app.get('/users/:id',async(req,res)=>{
    try{
        const users=await User.findByIdandDelete(req.params.id,req.body,{new:true,runValidators:true});
        if(!user) return res.status(404).send();
        res.status(201).send(users);
    }
    catch (error){
        res.status(400).send(error);

    }
})