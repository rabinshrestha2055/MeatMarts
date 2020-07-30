const jwt=require('jsonwebtoken');
const config=require('../middleware/config');
module.exports=(req,res,next)=>{
    try {
        var token =req.headers.authorization.split(" ")[1];
       var decoded= jwt.verify(token,config.secret);
       req.userData=decoded;
    
    //    console.log(decoded);
    //    console.log(token);
     next();
    } catch (error) {
        res.status(401).json({
            error:"Invalid Token"
        })
    }

}
