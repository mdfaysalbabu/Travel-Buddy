import { z } from "zod";

const statusEnum = z.enum(["PENDING", "APPROVED", "CANCELLED"]);

const createTravelBuddyRequestValidation = z.object({
  userId: z.string().uuid({ message: "Invalid user ID format" }),
});

// Validation schema for updating a travel buddy request status
const updateTravelBuddyRequestStatusValidation = z.object({
  status: statusEnum,
});

export const travelBuddyValidation = {
  createTravelBuddyRequestValidation,
  updateTravelBuddyRequestStatusValidation,
};
