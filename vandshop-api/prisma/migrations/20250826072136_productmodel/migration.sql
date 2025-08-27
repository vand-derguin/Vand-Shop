/*
  Warnings:

  - A unique constraint covering the columns `[barecode]` on the table `Product` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `barecode` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Product` ADD COLUMN `barecode` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Product_barecode_key` ON `Product`(`barecode`);
