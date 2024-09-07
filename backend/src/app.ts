import express from "express";
import error from "./middlewares/error";
import authRouter from "./routes/authRoute";
import listingRouter from "./routes/listingRoute";
import ratingRouter from "./routes/ratingRoute";
import cors from "cors";

const app = express();
declare global {
  namespace Express {
    interface Request {
      user: any;
    }
  }
}
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/api/auth", authRouter);
app.use("/api/listing", listingRouter);
app.use("/api", ratingRouter);
app.use(error);
app.use("*", (req, res) => {
  return res.status(404).json({
    status: "error",
    message: `${req.originalUrl} not found on this server`,
    data: {},
  });
});

export default app;
