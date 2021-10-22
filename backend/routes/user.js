const express = require("express");
const router = express.Router();
const userCtrl = require("../controllers/user");

router.get("/test",userCtrl.test);
router.post("/signup",userCtrl.signup);
router.post("/login",userCtrl.login);

module.exports = router;