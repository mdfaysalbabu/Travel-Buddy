/*
  Warnings:

  - Added the required column `description` to the `trips` table without a default value. This is not possible if the table is not empty.
  - Added the required column `photo` to the `trips` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `trips` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('ACTIVE', 'DEACTIVE');

-- AlterTable
ALTER TABLE "trips" ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "photo" TEXT NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'USER',
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'ACTIVE';
