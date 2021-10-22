const{ pool }= require('../config/db');
const bcrypt = require("bcrypt");


exports.test = (req,res,next) => {
    let sql = "SELECT * FROM user";
    pool.execute(sql,function(err,result){
        if(err) throw err;
        console.log(result);
        res.status(200).json(result)
    });
}

exports.signup = (req, res, next) => {
    bcrypt.hash(req.body.password, 10)
    .then(hash => {
        const user = {
            nom : req.body.nom,
            prenom : req.body.prenom,
            email: req.body.email,
            password : hash,
        }
        let sql = `INSERT INTO user (nom, prenom, email, password) VALUES ("${user.nom}","${user.prenom}","${user.email}","${user.password}")`;
        pool.execute(sql,function(err,result){
            if(err) throw err;
            res.status(201).json({ message: `Utilisateur ${user.prenom} ajouté` });
        })
    })
    .catch(error => res.status(500).json({ error }));
};

exports.login = (req, res, next) => {
    let sql = `SELECT * FROM user WHERE email="${req.body.email}"`;
    pool.execute(sql,function(err,result){
        let user = result[0];
        if (!user)  return res.status(401).json({ error: "Email incorrect" });
        bcrypt.compare(req.body.password, user.password)
            .then(valid => {
                if (!valid) {
                    return res.status(401).json({ error: "mauvais mdp !" })
                }
                res.status(200).json({
                    userId: user._id,
                    token: jwt.sign(
                        { userId: user._id },
                        process.env.ACCESS_TOKEN,
                        { expiresIn: "24h" },
                    ),
                });
            })
            .catch(error => res.status(500).json({  message : "Erreur authentification" }));
    })
};