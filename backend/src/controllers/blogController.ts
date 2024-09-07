import { NextFunction, Request, Response } from "express";
import createHttpError from "http-errors";
import { uploadOnCloudinary } from "../utils/cloudinary";
import prisma from "../utils/prisma";
import { IReturnResponse } from "../types";
export const createBlog = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (req.user.role != "GUIDE") {
    return next(createHttpError(401, "unauthorized"));
  }
  let returnResponse: IReturnResponse;
  const touristAreaId = Number(req.params.id);
  const files = req.files as Express.Multer.File[];

  const { content, title } = req.body;

  const localFilePaths = files.map((file) => file.path);
  const photos = files.map((file) => file.path);
  console.log(photos);
  const uploaded = await uploadOnCloudinary(localFilePaths);
  if (!uploaded) {
    return next(createHttpError(400, "failed to upload image"));
  }
  let chitra: string[] = [];
  uploaded?.map((photo) => {
    chitra.push(photo!.secure_url);
  });

  const result = await prisma.blog.create({
    data: {
      title,
      content,
      touristAreaId,
      guideId: req.user.id,
      images: chitra,
    },
  });

  returnResponse = {
    data: result,
    message: "blog successfully created",
    status: "success",
  };

  return res.status(201).json(returnResponse);
};

export const getAreaBlogs = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const areaId = parseInt(req.params.id);

  const result = await prisma.blog.findMany({
    where: {
      touristAreaId: areaId,
    },
  });
  returnResponse = {
    data: result,
    message: " Area blog successfully fetched",
    status: "success",
  };

  return res.status(201).json(returnResponse);
};
export const getGuideBlogs = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const guideId = parseInt(req.params.id);

  const result = await prisma.blog.findMany({
    where: {
      guideId,
    },
  });
  returnResponse = {
    data: result,
    message: "Guide blog successfully fetched",
    status: "success",
  };

  return res.status(201).json(returnResponse);
};
