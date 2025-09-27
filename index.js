const express = require('express');
port = process.env.PORT ?? 8000;
const app = express();


app.get("/", (req,res)=>{
    return res.json({ status : "suceess", message: "Hellow from express server" })
})


app.listen(port,()=>{
    console.log(`server start at port ${port}`)
})