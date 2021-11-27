const jwt = require("jsonwebtoken");

module.exports = (req,res,next) => {
    try{
        const token = req.headers.authorization.split(' ')[1];
        const decodedToken = jwt.verify(token,process.env.SECRET_TOKEN_KEY);
        const userId = decodedToken.userId;
        
        if (req.body.userId && req.body.userId != userId) {
            return res.status(403).json("unauthorized request")
        }else{
            next();
        }
    }catch(e){
        res.status(401).json({error:'Invalid request!'});
    }
}
