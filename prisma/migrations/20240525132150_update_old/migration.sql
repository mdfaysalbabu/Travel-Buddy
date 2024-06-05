/*
  Warnings:

  - You are about to drop the column `buddyId` on the `travelbuddyrequests` table. All the data in the column will be lost.
  - You are about to drop the column `itinerary` on the `trips` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "travelbuddyrequests" DROP CONSTRAINT "travelbuddyrequests_buddyId_fkey";

-- AlterTable
ALTER TABLE "travelbuddyrequests" DROP COLUMN "buddyId";

-- AlterTable
ALTER TABLE "trips" DROP COLUMN "itinerary",
ADD COLUMN     "activities" TEXT[];

-- CreateTable
CREATE TABLE "userprofiles" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "bio" TEXT,
    "age" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "userprofiles_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "userprofiles_userId_key" ON "userprofiles"("userId");

-- AddForeignKey
ALTER TABLE "travelbuddyrequests" ADD CONSTRAINT "travelbuddyrequests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userprofiles" ADD CONSTRAINT "userprofiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
