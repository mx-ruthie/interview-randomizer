import express from "express";
import cors from "cors";
//import dotenv from 'dotenv';

import models, { sequelize } from './models/index.js';




const app = express();
const PORT = 8088;

app.use(cors());

app.get("/", (req, res) => {
    res.json("hello from techtonica");
});

await sequelize.authenticate();

//adding columns after creation of table by adding { alter: true } as a parameter according to this doc
//https://sequelize.org/docs/v6/core-concepts/model-basics/#model-synchronization
sequelize.sync({ alter: true }).then(() => {
    app.listen(process.env.PORT, () => {
      console.log(`Mock interview project is listening on ${PORT}!`);
    });
  });

