const express = require("express");
const router = express.Router();
const commentCtrl = require("../controllers/comment");
const auth = require("../middleware/auth");

router.post("/",auth, commentCtrl.create);
router.get("/",auth, commentCtrl.getAll);
router.delete("/:commentId/:postId", auth, commentCtrl.delete);


module.exports = router;