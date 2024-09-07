import { Router } from "express";
import asyncErrorHandler from "./../utils/asyncErrorHandler";
import { submitRating } from "../controllers/ratingController";

const router = Router();

router.route("/rating").post(asyncErrorHandler(submitRating));

export default router;
