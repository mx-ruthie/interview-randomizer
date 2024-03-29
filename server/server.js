import express from "express";
import cors from "cors";
import { dirname } from "path";
import path from "path";
import models, { sequelize } from "./models/index.js";

const app = express();
//the following line is needed to parse JSON data from the request body
app.use(express.json());
const __dirname = dirname(new URL(import.meta.url).pathname);
const REACT_BUILD_DIR = path.join(__dirname, "..", "build");
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
app.get("/api/savedquestions/:participantId", async (req, res) => {
  try {
    const participantId  = req.params.participantId;
    // console.log("params", req.params, "participantID", participantId);
    // Retrieve all saved entries with associated questions
    const currentParticipant = await models.Participant.findByPk(
      participantId,
      {
        // include is for eager loading associations (https://sequelize.org/docs/v6/core-concepts/assocs/#eager-loading-example)
        include: [
          {
            model: models.Question,
          },
        ],
      }
    );
    console.log("currentParticipant", currentParticipant);
    res.json(currentParticipant);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Failed to retrieve saved entries" });
  }
});
app.post("/api/completequestion", async (req, res) => {
  console.log("req.body", req.body);
  try {
    const { questionId, participantId } = req.body;
    const participant = await models.Participant.findByPk(participantId);
    const result = await participant.addQuestion(questionId);
    console.log("result", result);
    return res.json(result);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Failed to save completed question" });
  }
});

app.post("/api/user", async (req, res) => {
  try {
    const newUser = req.body;
    const result = await models.Participant.findOrCreate({
      where: { sub: newUser.sub },
      defaults: {
        nickname: newUser.nickname,
        given_name: newUser.given_name,
        family_name: newUser.family_name,
        picture: newUser.picture,
        email: newUser.email,
      },
    });
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
