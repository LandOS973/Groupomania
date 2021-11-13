const{ pool }= require('../config/db');
const bcrypt = require("bcrypt");
const jwt = require('jsonwebtoken');
const dotenv = require("dotenv").config();


exports.delete = (req,res,next) => {
    const userId = req.body.userId;
    let sql = `DELETE FROM user WHERE id='${userId}'`;
    pool.execute(sql,function(err,result){
        if(err) throw err;
        console.log(result);
        res.status(200).json({message : `Compte numéro ${userId} supprimé`})
    });
}

exports.signup = (req, res, next) => {
    bcrypt.hash(req.body.password, 10)
    .then(hash => {
        const image = `${req.protocol}://${req.get('host')}/images/profile/pp.png`;
        const user = {
            nom : req.body.nom,
            prenom : req.body.prenom,
            email: req.body.email,
            password : hash,
            imageUrl : image,
        }
        let sql = `INSERT INTO user (nom, prenom, email, password, pp) VALUES ("${user.nom}","${user.prenom}","${user.email}","${user.password}","${user.imageUrl}")`;
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
                    return res.status(401).json({ error: " Mot de passe incorrect !" })
                }
                console.log("utilisateur connecté");
                res.status(200).json({
                    userId: user.id,
                    token: jwt.sign(
                        { userId: user.id },
                        process.env.SECRET_TOKEN_KEY,
                        { expiresIn: "24h" },
                    ),
                })
            })
            .catch(error => res.status(500).json({  message : "Erreur authentification" }));
    })
};

exports.getOne = (req, res, next) => {
    // TOUT LES POST DU DERNIER AU PREMIER
    let sql = `SELECT * FROM user WHERE user.id=${req.body.userId};`;
    pool.execute(sql, function (err, result) {
        if (err) res.status(400).json({ err });
        res.status(200).json(result)
    });
}
