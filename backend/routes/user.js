const express = require("express");
const router = express.Router();
const userCtrl = require("../controllers/user");
const multer = require("../middleware/multer");

router.delete("/delete",userCtrl.delete);
router.post("/signup", multer, userCtrl.signup);
router.post("/login",userCtrl.login);

module.exports = router;