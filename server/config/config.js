/**
 * Imports dotenv instead of using a config.json since .json files cannot be formatted with .env variables
 */
import dotenv from 'dotenv';
dotenv.config();

module.exports = {
  development: {
    username: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE,
    host: '127.0.0.1',
    dialect: 'postgres',
  },
  // production: {
  //   username: process.env.DATABASE_USER,
  //   password: process.env.DATABASE_PASSWORD,
  //   database: process.env.DATABASE,
  //   // host: process.env.DB_HOSTNAME,
  //   // port: process.env.DB_PORT,
  //   dialect: 'postgres'
  // }
};