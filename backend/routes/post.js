const express = require("express");
const router = express.Router();
const postCtrl = require("../controllers/post");
const auth = require("../middleware/auth");
const multer = require("../middleware/multer");

router.get("/", postCtrl.getAll);
router.post("/", multer, postCtrl.create);
router.delete("/:id", postCtrl.delete);
router.put("/:id", multer, postCtrl.modify);

module.exports = router;