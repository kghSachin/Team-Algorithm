/*
  Warnings:

  - Added the required column `latitude` to the `TouristArea` table without a default value. This is not possible if the table is not empty.
  - Added the required column `longitude` to the `TouristArea` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
ALTER TYPE "Role" ADD VALUE 'ADMIN';

-- AlterTable
ALTER TABLE "TouristArea" ADD COLUMN     "latitude" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "longitude" DOUBLE PRECISION NOT NULL;
