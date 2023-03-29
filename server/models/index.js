//at this phase of this tutorial on save https://www.robinwieruch.de/postgres-express-setup-tutoria%20wil/#:~:text=To%20connect%20PostgreSQL%20to%20your,convert%20data%20among%20incompatible%20types
//"There is often also a file (e.g. src/models/index.js) that combines all models and exports all them as database interface to the Express application."

import Sequelize from 'sequelize';

import dotenv from 'dotenv';
import getParticipantModel from './participant.js';
import getQuestionModel from './question.js';
dotenv.config()
console.log("config")
console.log("process.env.DATABASE", process.env.DATABASE);
const sequelize = new Sequelize(
  process.env.DATABASE,
  process.env.DATABASE_USER,
  process.env.DATABASE_PASSWORD,
  {
    dialect: 'postgres',
  },
);

const models = {
  User: getParticipantModel(sequelize, Sequelize),
  Message: getQuestionModel(sequelize, Sequelize),
};

Object.keys(models).forEach((key) => {
  if ('associate' in models[key]) {
    models[key].associate(models);
  }
});

export { sequelize };

export default models;