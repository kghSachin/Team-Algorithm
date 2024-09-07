import { Router } from "express";
import asyncErrorHandler from "./../utils/asyncErrorHandler";
import {
  createListing,
  getAllListings,
  getListing,
} from "../controllers/listingController";
const router = Router();

router.route("/create").post(asyncErrorHandler(createListing));
router.route("/get/:id").post(asyncErrorHandler(getListing));
router.route("/get").post(asyncErrorHandler(getAllListings));

export default router;
