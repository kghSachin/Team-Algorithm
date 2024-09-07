import { Router } from "express";
import {
  createListing,
  getAllListings,
  getListing,
} from "../controllers/listingController";
const router = Router();

router.route("/create").post(createListing);
router.route("/get/:id").post(getListing);
router.route("/get").post(getAllListings);

export default router;
