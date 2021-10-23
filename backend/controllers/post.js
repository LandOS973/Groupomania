const{ pool }= require('../config/db');



exports.getAll = (req,res,next) => {
    let sql = "SELECT * FROM post ORDER BY date DESC";
    pool.execute(sql,function(err,result){
        if(err) res.status(400).json({ e });
        console.log(result);
        res.status(200).json(result)
    });
}

exports.create = (req, res, next) => {
    const image = (req.file) ? `${req.protocol}://${req.get('host')}/images/${req.file.filename}` : "";
    console.log(image);
    const post = {
        text : req.body.post.text,
        imageUrl: "image",
        like: 0,
        date : new Date().toLocaleString("af-ZA", {timeZone: "Europe/Paris"})
    };
    let sql = `INSERT INTO post (text, imageUrl, date) VALUES ("${post.text}","${post.imageUrl}","${post.date}");`;
    pool.execute(sql,function(err,result){
        if(err) throw err;
        res.status(201).json({ message: `Post ajouté` });
    })
};