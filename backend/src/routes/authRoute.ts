import { Router } from "express";
import {
  login,
  registerGuide,
  registerTourist,
} from "../controllers/authController";
import asyncErrorHandler from "../utils/asyncErrorHandler";
import upload from "./../middlewares/multer";

const router = Router();

router.route("/login").post(asyncErrorHandler(login));
router
  .route("/registerguide")
  .post(upload.single("photo"), asyncErrorHandler(registerGuide));
router.route("/register").post(asyncErrorHandler(registerTourist));

export default router;
