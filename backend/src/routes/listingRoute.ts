import { Router } from "express";
import asyncErrorHandler from "./../utils/asyncErrorHandler";
import {
  getAllPlaces,
  getAllTouristArea,
  createTareaListing,
  createPlaceListing,
  getAllguides,
  searchCity,
} from "../controllers/listingController";
import authenticate from "../middlewares/authenticate";
import upload from "../middlewares/multer";
const router = Router();

router
  .route("/create")
  .post(upload.single("photo"), asyncErrorHandler(createPlaceListing));
router
  .route("/createtouristarea/:id")
  .post(upload.array("photo", 5), asyncErrorHandler(createTareaListing));
router.route("/get").get(asyncErrorHandler(getAllPlaces));
router.route("/get/:id").get(asyncErrorHandler(getAllTouristArea));
router.route("/getguides").get(asyncErrorHandler(getAllguides));
router.route("/search").get(asyncErrorHandler(searchCity));

export default router;
