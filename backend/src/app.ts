import express from "express";
import error from "./middlewares/error";

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(error);
export default app;
