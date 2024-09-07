import { Router } from "express";
import asyncErrorHandler from "./../utils/asyncErrorHandler";
import { submitRating } from "../controllers/ratingController";
import authenticate from "../middlewares/authenticate";

const router = Router();

router.route("/rating").post(asyncErrorHandler(authenticate),asyncErrorHandler(submitRating));

export default router;
