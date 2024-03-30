import express from "express";
import auth from "../../middleWare/auth";
import { travelBuddyController } from "./travel.buddy.controller";


const router = express.Router();
router.post(
  "/trip/:tripId/request",
  auth(),
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
  travelBuddyController.respondBuddyRequestController
);
export const travelBuddyRoutes = router;
