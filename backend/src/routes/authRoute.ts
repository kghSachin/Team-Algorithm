import { Router } from "express";
import {
  login,
  registerGuide,
  registerTourist,
} from "../controllers/authController";
import asyncErrorHandler from "../utils/asyncErrorHandler";

const router = Router();

router.route("/login").post(asyncErrorHandler(login));
router.route("/registerguide").post(asyncErrorHandler(registerGuide));
router.route("/register").post(asyncErrorHandler(registerTourist));

export default router;
