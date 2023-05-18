import express from "express";
import cors from "cors";

import models, { sequelize } from './models/index.js';
import path from 'path';



const app = express();
///Users/tpl622_1/code/interview-randomizer
const REACT_BUILD_DIR = path.join(__dirname, 'build');
app.use(express.static(REACT_BUILD_DIR));
const PORT = process.env.PORT || 8088;

app.use(cors());

app.get("/", (req, res) => {
    res.sendFile(path.join(REACT_BUILD_DIR, 'index.html'));
});

app.get("/questions", async (req, res) => {
  const questions = await models.Question.findAll();
  console.log("All questions:", JSON.stringify(questions));
  res.json(questions);
});

app.post("/api/user", async (req, res) => {
  try {
    const newUser = req.body;
    const result = await db.query(
      "INSERT INTO users(createdAt, updatedAt,nickname, given_name, family_name, picture, sub, email) VALUES ($1,$2,$3, $4, $5, $6, $7, $8) RETURNING *",
      [newUser.createdAT, newUser.updatedAT, newUser.nickname, newUser.given_name, newUser.family_name, newUser.picture, newUser.sub, newUser.email]
    );
    console.log("New user created:", result.rows[0]);
    res.json(result.rows[0]); // send the new user data in the response
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Failed to create new user" });
  }
});

//adding columns after creation of table by adding { alter: true } as a parameter according to this doc
//https://sequelize.org/docs/v6/core-concepts/model-basics/#model-synchronization
sequelize.sync({ alter: true }).then(() => {
    app.listen(PORT, () => {
      console.log(`Mock interview project is listening on ${PORT}!`);
    });
  });

