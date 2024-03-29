import { PrismaClient, TravelBuddyRequest } from "@prisma/client";

const prisma = new PrismaClient();

const sendTravelBuddyRequest = async (
  tripId: string,
  userId: string
): Promise<TravelBuddyRequest> => {
  const request = await prisma.travelBuddyRequest.create({
    data: {
      tripId,
      userId,
      status: "PENDING",
    },
  });

  return request;
};

const getTravelBuddies = async (
  tripId: string
): Promise<TravelBuddyRequest[]> => {
  const potentialBuddies = await prisma.travelBuddyRequest.findMany({
    where: {
      tripId,
    },
    include: {
      user: {
        select: {
          id: true,
          name: true,
          email: true,
        },
      },
    },
  });

  return potentialBuddies;
};

const respondTravelBuddyRequest = async (
  buddyId: string,
  status: string
): Promise<TravelBuddyRequest | null> => {
  const updatedRequest = await prisma.travelBuddyRequest.update({
    where: {
      id: buddyId,
    },
    data: {
      status,
      updatedAt: new Date(),
    },
  });

  return updatedRequest;
};

export const travelBuddyServices = {
  sendTravelBuddyRequest,
  getTravelBuddies,
  respondTravelBuddyRequest,
};
