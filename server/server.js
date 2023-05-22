import express from "express";
import cors from "cors";
import {dirname} from 'path';
import models, { sequelize } from './models/index.js';
import path from 'path';



const app = express();
const __dirname = dirname(new URL(import.meta.url).pathname);
///Users/tpl622_1/code/interview-randomizer
const REACT_BUILD_DIR = path.join(__dirname, 'build');
app.use(express.static(REACT_BUILD_DIR));
const PORT = process.env.PORT || 8088;

app.use(cors());

app.get("/", (req, res) => {
  res.sendFile(path.join(REACT_BUILD_DIR, "index.html"));
});

app.get("/questions", async (req, res) => {
  const questions = await models.Question.findAll();
  console.log("All questions:", JSON.stringify(questions));
  res.json(questions);
});

app.get("/api/users", async (req, res) => {
  try {
    const object = await db.query("SELECT * FROM users");
    let users = object.rows;
    res.send(users);
  } catch (e) {
    return res.status(400).json({ e });
  }
});
app.post("/api/user", async (req, res) => {
  try {
    const newUser = req.body;
    const result = await models.Participant.create({
      nickname: newUser.nickname,
      given_name: newUser.given_name,
      family_name: newUser.family_name,
      picture: newUser.picture,
      sub: newUser.sub,
      email: newUser.email,
    }
    console.log("New user created:", result);
    res.json(result); // send the new user data in the response
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
