/*
  Warnings:

  - The `photo` column on the `Place` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `placeId` on the `Rating` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Rating" DROP CONSTRAINT "Rating_placeId_fkey";

-- AlterTable
ALTER TABLE "Place" DROP COLUMN "photo",
ADD COLUMN     "photo" TEXT[];

-- AlterTable
ALTER TABLE "Rating" DROP COLUMN "placeId",
ADD COLUMN     "touristAreaId" INTEGER;

-- CreateTable
CREATE TABLE "TouristArea" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "photo" TEXT[],
    "rating" INTEGER NOT NULL DEFAULT 0,
    "placeId" INTEGER NOT NULL,

    CONSTRAINT "TouristArea_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TouristArea" ADD CONSTRAINT "TouristArea_placeId_fkey" FOREIGN KEY ("placeId") REFERENCES "Place"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_touristAreaId_fkey" FOREIGN KEY ("touristAreaId") REFERENCES "TouristArea"("id") ON DELETE SET NULL ON UPDATE CASCADE;
