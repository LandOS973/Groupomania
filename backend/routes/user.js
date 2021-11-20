const express = require("express");
const router = express.Router();
const userCtrl = require("../controllers/user");
const multer = require("../middleware/multer");
const auth = require("../middleware/authGetUser")

router.delete("/delete", userCtrl.delete);
router.post("/signup", multer, userCtrl.signup);
router.post("/login", userCtrl.login);
router.post("/", auth, userCtrl.getOne);

module.exports = router;