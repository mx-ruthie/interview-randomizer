import express from "express";
import cors from "cors";
import {dirname} from 'path';
import path from "path";
import models, { sequelize } from './models/index.js';
// import {auth} from 'express-oauth2-jwt-bearer';
// import auth0 from "auth0";
// import pkg from 'auth0';
// const { AuthenticationClient } = pkg;



const app = express();
//the following line is needed to parse JSON data from the request body
app.use(express.json());
const __dirname = dirname(new URL(import.meta.url).pathname);
///Users/tpl622_1/code/interview-randomizer
const REACT_BUILD_DIR = path.join(__dirname, '..', 'build');
app.use(express.static(REACT_BUILD_DIR));
const PORT = process.env.PORT || 8088;

// const jwtCheck = auth({
//   audience: 'https://mockinterviewproject/api',
//   issuerBaseURL: 'https://dev-qke6400laa0q5ccg.us.auth0.com/',
//   tokenSigningAlg: 'RS256'
// });
// const auth0User = new AuthenticationClient({
//   domain: process.env.REACT_APP_AUTH0_DOMAIN,
//   clientId: process.env.REACT_APP_AUTH0_CLIENT_ID,
// });

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
  // const userToken = await auth0User.getProfile(req.auth0.token);
  // const userProfile = {id: userToken.sub, nickname: userToken.nickname, givenName: userToken.given_name, familyName: userToken.family_name, picture: userToken.picture, email: userToken.email};
  
  // console.log(userProfile);
  console.log(req.body, "i'm in api/user");
  try {
    const newUser = req.body;
    const result = await models.Participant.create({
      nickname: newUser.nickname,
      given_name: newUser.given_name,
      family_name: newUser.family_name,
      // picture: newUser.picture,
      sub: newUser.sub,
      email: newUser.email,
    }
   
    );
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

