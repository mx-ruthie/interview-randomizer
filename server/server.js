import express from "express";
import cors from "cors";
import dotenv from 'dotenv';

dotenv.config()

const app = express();
const PORT = 8088;

app.use(cors());

app.get("/", (req, res) => {
    res.json("hello from techtonica");
});

app.listen(PORT, () => console.log(`Hola! Server is running on port ${PORT}`));
