const express=require('express');
const mongoose=require('mongoose');
const userModel=require('../models/user.model');
const router=express.Router();
const bcrypt=require('bcrypt');
const jwt=require('jsonwebtoken');
const config=require('../middleware/config');

router.post('/login',(req,res,next)=>{
    userModel.find({email:req.body.email})
    .exec()
    .then(user=>{
        if(user.length<1)
        {
            res.status(404).json({
            
                message:'Auth Failed!',
               
            })
        
        }else{
            bcrypt.compare(req.body.password,user[0].password,function(err,result){
                if(err){
                    res.status(404).json({
            
                        message:'Auth Failed!',
                       
                    }); 
                }
                if(result)
                {
                   var token= jwt.sign({
                        userid:user[0]._id,
                    },config.secret,{ expiresIn:"24h"}
                    )
                    res.status(201).json({
                        
                        message:'User found!!',
                        id:user[0]._id,
                        token:token,
                    })
                }else{
                    res.status(404).json({
            
                        message:'Auth Failed!',
                       
                    }); 
                }
            })
     
    }
    })
    .catch(err=>{
        console.log(err);
        res.status(500).json({
            error:err,
        })
    })
})

router.post('/signup',(req,res,next)=>{
     var username=req.body.username;
     var email=req.body.email;
     var password=req.body.password;
     var confirmPassword=req.body.confirmPassword;
     if(password!==confirmPassword)
     {
         res.json({
             message:"Password Not Matched!!"
           
         })
     }else{
        bcrypt.hash(req.body.password,10,(err,hash)=>{
            if (err){
                return res.status(500).json({
                    message:"Something Wrong,Try Later!!",
                    error:err,
                })
            }else{
                const user=new userModel({
                    _id:new mongoose.Types.ObjectId(),
                     username:username,
                     email:email,
                     password:hash,
                   
                })
                user.save()
                .then(result=>{
                    res.status(201).json({
                        message:"user created",
                        result:result
                    })
                })
                .catch(err=>{
                    console.log(err);
                    res.status(500).json({
                        error:err,
                    })

                });
            }
            
        })

    }
 });

router.get('/logout',function(req,res){
    res.status(200).send({auth:false,token:null})
})

module.exports=router;