import { v2 as cloudinary } from "cloudinary";
import * as Config from "../config";
import fs from "node:fs";

cloudinary.config({
  cloud_name: Config.CLOUDINARY_CLOUD_NAME,
  api_key: Config.CLOUDINARY_API_KEY,
  api_secret: Config.CLOUDINARY_CLOUD_SECRET, // Click 'View API Keys' above to copy your API secret
});

export const uploadOnCloudinary = async (localFilePaths: string | string[]) => {
  try {
    // Ensure localFilePaths is an array
    const paths = Array.isArray(localFilePaths)
      ? localFilePaths
      : [localFilePaths];

    const uploadPromises = paths.map(async (localFilePath) => {
      if (!localFilePath) {
        return null;
      }
      const res = await cloudinary.uploader.upload(localFilePath, {
        resource_type: "image",
      });
      fs.unlinkSync(localFilePath);
      return res;
    });

    const results = await Promise.all(uploadPromises);
    return results;
  } catch (error) {
    console.log(error);
    if (Array.isArray(localFilePaths)) {
      localFilePaths.forEach((path) => fs.unlinkSync(path));
    } else {
      fs.unlinkSync(localFilePaths);
    }
    return null;
  }
};

export default cloudinary;
