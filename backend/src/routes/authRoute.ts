import { Router } from "express";
import {
  login,
  registerGuide,
  registerTourist,
} from "../controllers/authController";
const router = Router();

router.route("/login").post(login);
router.route("/registerguide").post(registerGuide);
router.route("/register").post(registerTourist);

export default router;
