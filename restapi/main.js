const express=require("express");
const app=express();
const mongoose=require('mongoose');
const port=process.env.PORT || 3000;
const userRoute=require('./routes/user');
const bodyParser=require('body-parser');
/*-------Mongodb Database Connection-------*/
mongoose.connect('mongodb://localhost:27017/KhasiList', {useNewUrlParser: true, useCreateIndex: true,useUnifiedTopology:true});
/*---------end----------*/

/*------KhasiListRoute(middleware) module-------*/
const khasiListRoute=require('./routes/khasi_category');
/*-------end-----------------*/

/*-------body-parser(json data)----*/
  app.use(bodyParser.urlencoded({extended:true,limit:'50mb'}));  //extended:false means that it only support simple bodies for url encoded data.
  app.use(bodyParser.json({limit:'50mb'}),);
/*---------end----------*/

/*---------UserRoute------------*/
app.use('/user',userRoute);
/*---------end-----------------*/

/*--------cors error handling process-------*/
app.use((req,res,next)=>{
  res.header('Access-Control-Allow-Origin','*');
  res.header(
      'Access-Control-Allow-Headers',
      'Origin','X-Requested-With','Content-Type','Accept','Autorization'
      );
      if(req.method=='Options'){
          res.header('Aceess-Control-Allow-Methods','PUT,Post,Patch,Delete, Get');
           return res.status(200).json({});
      }
      next();
})

/*------------end---------------------------*/

/*------root route----------*/
app.get("/",(req,res)=>{
  res.status(200).json({
      msg:"Khasi List Api Created",
      get:'http://localhost:3000/khasiLists',
      post:'http://localhost:3000/khasiLists'
  })
});
app.listen(port,()=>{
  console.log(`Server is running on port ${port}`);  
});
/*---------end---------------*/

/*----Routes which should handle requests----*/

app.use('/khasiLists',khasiListRoute);

/*-------end-------------*/

/*------error handling------*/
app.use((req,res,next)=>{
  const error=new Error("Not Found");
  error.status=404;
  next(error); //middleware
});

app.use((error,req,res,next)=>{
  res.status(error.status || 500);
  res.json({
    error:({
      error:{
        msg:error.message,
      }
    })
  })
})
/*-------end---------*/

