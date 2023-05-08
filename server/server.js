import express from "express";
import cors from "cors";

import models, { sequelize } from './models/index.js';
import path from 'path';



const app = express();
///Users/tpl622_1/code/interview-randomizer
const REACT_BUILD_DIR = path.join(__dirname, '..', 'build');
app.use(express.static(REACT_BUILD_DIR));
const PORT = process.env.PORT || 8088;

app.use(cors());

app.get("/", (req, res) => {
    res.sendFile(path.join(REACT_BUILD_DIR, 'index.html'));
});

app.get("/questions", async (req, res) => {
// this should really be in a seeding script but took a shortcut to get one piece of data in DB for development in React
  // const newQuestion = await models.Question.create({ 
    
// 			text: "The parameter weekday is true if it is a weekday, and the parameter vacation is true if we are on vacation. We sleep in if it is not a weekday or we're on vacation. Return true if we sleep in.",
// 			testCases: [
// 				"sleep_in(false, false) → true;",
// 				"sleep_in(true, false) → false;",
// 				"sleep_in(false, true) → true;"
// 			]
// 		}
//     );
  const questions = await models.Question.findAll();
  console.log("All questions:", JSON.stringify(questions));
  res.json(questions);
});


//adding columns after creation of table by adding { alter: true } as a parameter according to this doc
//https://sequelize.org/docs/v6/core-concepts/model-basics/#model-synchronization
sequelize.sync({ alter: true }).then(() => {
    app.listen(PORT, () => {
      console.log(`Mock interview project is listening on ${PORT}!`);
    });
  });

