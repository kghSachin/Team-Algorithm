import express from "express";
import error from "./middlewares/error";
import authRouter from "./routes/authRoute";
import listingRouter from "./routes/listingRoute";

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/api/auth", authRouter);
app.use("/api/listing", listingRouter);
app.use(error);
export default app;
