import { Router } from "express";
import asyncErrorHandler from "./../utils/asyncErrorHandler";
import {
  getAllPlaces,
  getAllTouristArea,
  createTareaListing,
  createPlaceListing,
} from "../controllers/listingController";
import authenticate from "../middlewares/authenticate";
import upload from "../middlewares/multer";
const router = Router();

router
  .route("/create")
  .post(
    asyncErrorHandler(authenticate),
    upload.single("photo"),
    asyncErrorHandler(createPlaceListing)
  );
router
  .route("/createtouristarea/:id")
  .post(upload.array("photo", 5), asyncErrorHandler(createTareaListing));
router.route("/get").get(asyncErrorHandler(getAllPlaces));
router.route("/get/:id").get(asyncErrorHandler(getAllTouristArea));

export default router;
