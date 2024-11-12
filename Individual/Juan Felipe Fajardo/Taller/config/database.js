import {connect} from "mongoose"
import {config} from "dotenv"

config()

export const connectDB = async()=>{
try{
    const connection = await connect(`mongodb://${process.env.MONGO_HOST}:$`)
} catch (err){
    throw Error("Error: "+error.message)
}
}