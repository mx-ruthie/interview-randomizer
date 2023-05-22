/**
 * Imports dotenv instead of using a config.json since .json files cannot be formatted with .env variables
 */
import dotenv from 'dotenv';
dotenv.config();

console.log("I'm running this file")
module.exports = {
  development: {
   url: process.env.DATABASE_URL,
    dialect: 'postgres',
  },
  production: {
    url: process.env.DATABASE_URL,
      dialect: 'postgres'
  }
};