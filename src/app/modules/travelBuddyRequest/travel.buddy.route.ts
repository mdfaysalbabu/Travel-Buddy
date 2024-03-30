import express from "express";
import auth from "../../middleWare/auth";
import { travelBuddyController } from "./travel.buddy.controller";
import validateRequest from "../../middleWare/validateRequest";
import { travelBuddyValidation } from "./travelBuddy.validation";

const router = express.Router();
router.post(
  "/trip/:tripId/request",
  auth(),
  // validateRequest(travelBuddyValidation.createTravelBuddyRequestValidation),
  travelBuddyController.sendRequestController
);

router.get(
  "/travel-buddies/:tripId",
  auth(),
  travelBuddyController.getBuddiesController
);

router.put(
  "/travel-buddies/:buddyId/respond",
  auth(),
  // validateRequest(
  //   travelBuddyValidation.updateTravelBuddyRequestStatusValidation
  // ),
  travelBuddyController.respondBuddyRequestController
);
export const travelBuddyRoutes = router;
