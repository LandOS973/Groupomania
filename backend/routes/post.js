const express = require("express");
const router = express.Router();
const postCtrl = require("../controllers/post");
const auth = require("../middleware/auth");
const multer = require("../middleware/multer");

router.get("/", auth, postCtrl.getAll);
router.post("/", auth, multer, postCtrl.create);
router.post("/byAuthor",postCtrl.getByAuthor);
router.delete("/:id", auth, postCtrl.delete);
router.put("/:id", multer, postCtrl.modify);

module.exports = router;