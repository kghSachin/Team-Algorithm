-- AlterTable
ALTER TABLE "Guide" ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'GUIDE';

-- AlterTable
ALTER TABLE "Tourist" ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'TOURIST';
