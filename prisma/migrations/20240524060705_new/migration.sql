/*
  Warnings:

  - The `status` column on the `travelbuddyrequests` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `activities` on the `trips` table. All the data in the column will be lost.
  - Added the required column `description` to the `trips` table without a default value. This is not possible if the table is not empty.
  - Added the required column `itinerary` to the `trips` table without a default value. This is not possible if the table is not empty.
  - Added the required column `travelType` to the `trips` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contactNumber` to the `userprofiles` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'USER');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'DEACTIVE');

-- CreateEnum
CREATE TYPE "BuddyRequestStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED');

-- AlterTable
ALTER TABLE "travelbuddyrequests" DROP COLUMN "status",
ADD COLUMN     "status" "BuddyRequestStatus" NOT NULL DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "trips" DROP COLUMN "activities",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "itinerary" JSONB NOT NULL,
ADD COLUMN     "photos" TEXT[],
ADD COLUMN     "travelType" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "userprofiles" ADD COLUMN     "address" TEXT,
ADD COLUMN     "contactNumber" TEXT NOT NULL,
ADD COLUMN     "image" TEXT,
ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "name" TEXT,
ADD COLUMN     "occupation" TEXT;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'USER',
ADD COLUMN     "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE';
