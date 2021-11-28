const express = require("express");
const router = express.Router();
const userCtrl = require("../controllers/user");
const multer = require("../middleware/multerUser");
const auth = require("../middleware/authGetUser");
const authTokenId = require("../middleware/auth");
const validEmail = require("../middleware/email");

router.delete("/delete/:id", userCtrl.delete);
router.post("/signup", validEmail, multer, userCtrl.signup);
router.post("/login", userCtrl.login);
router.put("/modify/:id", authTokenId, multer, userCtrl.modifyPP);
router.put("/modifyAccount/:id", authTokenId, userCtrl.modifAccount);
router.put("/modifyPassword/:id", authTokenId, userCtrl.modifyPassword);
router.post("/", auth, userCtrl.getOne);
router.post("/getAs", auth, userCtrl.getAs);

module.exports = router;