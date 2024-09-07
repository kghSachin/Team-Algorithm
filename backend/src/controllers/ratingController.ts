import { Request, Response, NextFunction } from "express";
import prisma from "../utils/prisma";
import createHttpError from "http-errors";

export const submitRating = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { touristId, guideId, placeId, rating, comment } = req.body;

  try {
    const newRating = await prisma.rating.create({
      data: {
        rating,
        comment,
        touristId,
        guideId,
        placeId,
      },
    });

    res.status(201).json({
      status: "success",
      data: newRating,
    });
  } catch (error) {
    next(createHttpError(500, "Failed to submit rating"));
  }
};

export const getRatingsForGuide = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { guideId } = req.params;

  try {
    const ratings = await prisma.rating.findMany({
      where: { guideId: Number(guideId) },
      include: {
        tourist: {
          select: { fname: true, lname: true },
        },
      },
    });

    res.status(200).json({
      status: "success",
      data: ratings,
    });
  } catch (error) {
    next(createHttpError(500, "Failed to retrieve ratings"));
  }
};

export const getRatingsForPlace = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { placeId } = req.params;

  try {
    const ratings = await prisma.rating.findMany({
      where: { placeId: Number(placeId) },
      include: {
        tourist: {
          select: { fname: true, lname: true },
        },
      },
    });

    res.status(200).json({
      status: "success",
      data: ratings,
    });
  } catch (error) {
    next(createHttpError(500, "Failed to retrieve ratings"));
  }
};
