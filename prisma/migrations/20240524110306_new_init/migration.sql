/*
  Warnings:

  - The `status` column on the `travelbuddyrequests` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `isDeleted` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `users` table. All the data in the column will be lost.
  - The `role` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `userprofiles` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `buddyId` to the `travelbuddyrequests` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `travelType` on the `trips` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "RequestStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED');

-- CreateEnum
CREATE TYPE "TravelType" AS ENUM ('ADVENTURE', 'LEISURE', 'BUSINESS');

-- DropForeignKey
ALTER TABLE "travelbuddyrequests" DROP CONSTRAINT "travelbuddyrequests_userId_fkey";

-- DropForeignKey
ALTER TABLE "userprofiles" DROP CONSTRAINT "userprofiles_userId_fkey";

-- AlterTable
ALTER TABLE "travelbuddyrequests" ADD COLUMN     "buddyId" TEXT NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" "RequestStatus" NOT NULL DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "trips" DROP COLUMN "travelType",
ADD COLUMN     "travelType" "TravelType" NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "isDeleted",
DROP COLUMN "status",
DROP COLUMN "role",
ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'USER';

-- DropTable
DROP TABLE "userprofiles";

-- DropEnum
DROP TYPE "BuddyRequestStatus";

-- DropEnum
DROP TYPE "UserRole";

-- DropEnum
DROP TYPE "UserStatus";

-- AddForeignKey
ALTER TABLE "travelbuddyrequests" ADD CONSTRAINT "travelbuddyrequests_buddyId_fkey" FOREIGN KEY ("buddyId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
