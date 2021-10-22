const express = require("express");
const db = require("./config/db");
const app = express();
const userRoutes = require("./routes/user");
app.use(express.json());


app.use('/api/user',userRoutes);


app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
})

module.exports = app;