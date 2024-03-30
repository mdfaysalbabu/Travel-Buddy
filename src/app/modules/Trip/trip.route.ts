import express from "express";


import { tripController } from "./trip.controller";
import auth from "../../middleWare/auth";
import validateRequest from "../../middleWare/validateRequest";
import { tripValidation } from "./trip.validation";

const router = express.Router();

router.post(
  "/trips",
  auth(),
  // validateRequest(tripValidation.createTripValidation),
  tripController.createTrip
);
router.get("/trips", tripController.getTripsController);

export const tripRoutes = router;
