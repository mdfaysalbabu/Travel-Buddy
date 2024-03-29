import { Request, Response } from "express";
import { tripServices } from "./trip.service";
import catchAsync from "../../shared/catchAsync";
import pick from "../../shared/pick";
import { tripFilterAbleFields } from "./trip.constant";
import sendResponse from "../../shared/sendResponse";
import httpStatus from "http-status";

const createTrip = catchAsync(
  async (req: Request, res: Response): Promise<void> => {
    // Ensure req.user is defined and contains userId
    const { userId } = req.user;
    console.log(userId);
    if (!userId) {
      res.status(401).json({
        success: false,
        message: "Unauthorized: User ID not found",
      });
      return;
    }

    const { destination, startDate, endDate, budget, activities } = req.body;

    const trip = await tripServices.createTrip(
      userId,
      destination,
      startDate,
      endDate,
      budget,
      activities
    );

    sendResponse(res, {
      success: true,
      statusCode: 201,
      message: "Trip created successfully",
      data: trip,
    });
  }
);

const getTripsController = catchAsync(
  async (req: Request, res: Response): Promise<void> => {
    const filters = pick(req.query, tripFilterAbleFields);

    const options = pick(req.query, ["limit", "page", "sortBy", "sortOrder"]);

    const result = await tripServices.getFilteredTrips(filters, options);
    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Trips retrieved successfully",
      meta: result.meta,
      data: result.data,
    });
  }
);

export const tripController = {
  createTrip,
  getTripsController,
};
