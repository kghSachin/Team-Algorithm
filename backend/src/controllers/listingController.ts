import { NextFunction, Request, Response } from "express";
import prisma from "../utils/prisma";
import { IReturnResponse } from "../types";
import createHttpError from "http-errors";
import { uploadOnCloudinary } from "../utils/cloudinary";

export const createPlaceListing = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const { name, location } = req.body;
  const image = req.file;

  if (!image) {
    next(createHttpError(422, "image is a required field"));
  }

  const uploaded = await uploadOnCloudinary(image!.path);
  if (!uploaded) {
    return next(createHttpError(400, "unable to upload image"));
  }
  const result = await prisma.place.create({
    data: {
      name,
      location,
      photo: uploaded[0]!.secure_url,
    },
  });
  returnResponse = {
    data: result,
    message: "Place successfully created",
    status: "success",
  };
  return res.status(201).json("hi");
};
export const createTareaListing = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  console.log("hi");
  let returnResponse: IReturnResponse;
  const placeId = Number(req.params.id);
  const files = req.files as Express.Multer.File[];

  const { name, description } = req.body;

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

  const result = await prisma.touristArea.create({
    data: {
      name,
      description,
      placeId,
      photo: chitra,
    },
  });

  returnResponse = {
    data: result,
    message: "Tourist area successfully created",
    status: "success",
  };

  return res.status(201).json(returnResponse);
};

export const getAllPlaces = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const result = await prisma.place.findMany();
  returnResponse = {
    data: result,
    message: "Places fetched successfully",
    status: "success",
  };
  return res.status(200).json(returnResponse);
};
export const getAllTouristArea = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const placeId = Number(req.params.id);
  const result = await prisma.place.findUnique({
    where: {
      id: placeId,
    },
    include: {
      touristAreas: {
        select: {
          id: true,
          description: true,
          rating: true,
          name: true,
          photo: true,
        },
      },
    },
  });
  returnResponse = {
    data: { result },
    message: "Tourist Area fetched successfully",
    status: "success",
  };
  return res.status(200).json(returnResponse);
};