import { Router } from "express";
import asyncErrorHandler from "../utils/asyncErrorHandler";
import upload from "./../middlewares/multer";
import {
  createBlog,
  getAreaBlogs,
  getGuideBlogs,
} from "../controllers/blogController";

const router = Router();

router
  .route("/create")
  .post(upload.array("images", 5), asyncErrorHandler(createBlog));
router.route("/getguideblog").get(asyncErrorHandler(getGuideBlogs));
router.route("/getareablog").get(asyncErrorHandler(getAreaBlogs));
export default router;
