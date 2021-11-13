const { pool } = require('../config/db');

exports.create = (req, res, next) => {
    // DEFINI LES CHAMPS REMPLI
    const post = {
        comment: req.body.comment,
        authorId: req.body.authorId,
        postId: req.body.postId,
    };
    let sql = `UPDATE post SET post.comment = post.comment + 1 WHERE postId='${req.body.postId}';`;
    pool.execute(sql, function (err, result) {
        if (err) res.status(400).json({ err });
        let sql = `INSERT INTO comment (comment, authorId, postId) VALUES ("${post.comment}","${post.authorId}","${post.postId}");`;
        pool.execute(sql, function (err, result) {
            if (err) throw err;
            console.log(result)
            res.status(201).json({ message: `Commentaire ajouté` });
        })
    });
};

exports.getAll = (req, res, next) => {
    // TOUT LES POST DU DERNIER AU PREMIER
    let sql = `SELECT * from comment c JOIN user u WHERE c.authorId = u.id ORDER BY idComment;`;
    pool.execute(sql, function (err, result) {
        if (err) res.status(400).json({ err });
        res.status(200).json(result)
    });
}

exports.delete = (req, res, next) => {
    // TOUT LES POST DU DERNIER AU PREMIER
    let sql2 = `DELETE from comment WHERE idComment=${req.params.commentId};`;
    pool.execute(sql2, function (err, result) {
        if (err) res.status(400).json({ err });
        let sql = `UPDATE post SET post.comment = post.comment - 1 WHERE postId='${req.params.postId}';`;
        pool.execute(sql, function (err, result) {
            if (err) res.status(400).json({ err });
            res.status(200).json(result)
        });
    })
}

