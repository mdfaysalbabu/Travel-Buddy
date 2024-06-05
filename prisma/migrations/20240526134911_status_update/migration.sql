/*
  Warnings:

  - You are about to drop the column `description` on the `trips` table. All the data in the column will be lost.
  - You are about to drop the column `isDeleted` on the `trips` table. All the data in the column will be lost.
  - You are about to drop the column `photos` on the `trips` table. All the data in the column will be lost.
  - You are about to drop the column `travelType` on the `trips` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `users` table. All the data in the column will be lost.
  - Changed the type of `status` on the `travelbuddyrequests` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "travelbuddyrequests" DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "trips" DROP COLUMN "description",
DROP COLUMN "isDeleted",
DROP COLUMN "photos",
DROP COLUMN "travelType";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "role";

-- DropEnum
DROP TYPE "RequestStatus";

-- DropEnum
DROP TYPE "Role";

-- DropEnum
DROP TYPE "TravelType";
