/*
  Warnings:

  - Added the required column `password` to the `Guide` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Tourist` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Guide" ADD COLUMN     "password" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Tourist" ADD COLUMN     "password" TEXT NOT NULL;
