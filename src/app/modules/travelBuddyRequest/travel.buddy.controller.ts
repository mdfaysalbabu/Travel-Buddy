import catchAsync from "../../shared/catchAsync";
import sendResponse from "../../shared/sendResponse";
import { travelBuddyServices } from "./travel.buddy.service";
import { Request, Response } from "express";

const sendRequestController = catchAsync(
  async (req: Request, res: Response): Promise<void> => {
    const { tripId } = req.params;
    const { userId } = req.body;

    const request = await travelBuddyServices.sendTravelBuddyRequest(
      tripId,
      userId
    );

    sendResponse(res, {
      success: true,
      statusCode: 201,
      message: "Travel buddy request sent successfully",
      data: request,
    });
  }
);

const getBuddiesController = catchAsync(
  async (req: Request, res: Response): Promise<void> => {
    const { tripId } = req.params;

    const potentialBuddies = await travelBuddyServices.getTravelBuddies(tripId);

    sendResponse(res, {
      success: true,
      statusCode: 200,
      message: "Potential travel buddies retrieved successfully",
      data: potentialBuddies,
    });
  }
);

const respondBuddyRequestController = catchAsync(
  async (req: Request, res: Response): Promise<void> => {
    const { buddyId } = req.params;
    const { tripId, status } = req.body;

    const updatedRequest = await travelBuddyServices.respondTravelBuddyRequest(
      buddyId,
      tripId,
      status
    );

    if (!updatedRequest) {
      res.status(404).json({
        success: false,
        message: "Travel buddy request not found.",
      });
      return;
    }

    sendResponse(res, {
      success: true,
      statusCode: 200,
      message: "Travel buddy request responded successfully",
      data: updatedRequest,
    });
  }
);

export const travelBuddyController = {
  sendRequestController,
  getBuddiesController,
  respondBuddyRequestController,
};
