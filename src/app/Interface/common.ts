import { UserProfile } from "@prisma/client";

export type TAuthUser = {
  id: string;
  username: string;
  email: string;
  role: UserProfile;
  createdAt: Date;
  updatedAt: Date;
} | null;
