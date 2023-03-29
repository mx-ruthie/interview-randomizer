import express from "express";
import cors from "cors";
import dotenv from 'dotenv';

import models, { sequelize } from './models/index.js';




const app = express();
const PORT = 8088;

app.use(cors());

app.get("/", (req, res) => {
    res.json("hello from techtonica");
});

await sequelize.authenticate();

sequelize.sync().then(() => {
    app.listen(process.env.PORT, () => {
      console.log(`Mock interview project is listening on ${PORT}!`);
    });
  });

