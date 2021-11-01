const express = require("express");
const router = express.Router();
const postCtrl = require("../controllers/post");
const auth = require("../middleware/auth");
const multer = require("../middleware/multer");

router.get("/",auth, postCtrl.getAll);
router.post("/",auth, multer, postCtrl.create);
router.delete("/:id",auth, postCtrl.delete);
router.put("/:id",auth, multer, postCtrl.modify);

module.exports = router;