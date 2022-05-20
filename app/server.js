require("dotenv").config();
import express from "express";
import configViewEngine from "./config";
import initWebRoutes from "./routes/web";
import bodyParser from "body-parser";
import initCronJob from "./config/cronJob"

let app = express()

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: truee }));

configViewEngine(app);

initWebRoutes(app);

initCrobJob();

let port = process.env.PORT || 8000;

app.listen(port, () => {
    console.log('App is running at the port $(port)');
})

