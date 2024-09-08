import { NextFunction, Request, Response } from "express";
import prisma from "../utils/prisma";
import { IReturnResponse } from "../types";
import createHttpError from "http-errors";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import * as Config from "../config";
import cloudinary, { uploadOnCloudinary } from "./../utils/cloudinary";

export const login = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { email, password, role } = req.body;
  let returnResponse: IReturnResponse;
  let user;
  if (role === "TOURIST") {
    user = await prisma.tourist.findUnique({ where: { email } });
  } else if (role === "GUIDE") {
    user = await prisma.guide.findUnique({ where: { email } });
  }
  if (!user) {
    return next(createHttpError(400, "Email does not exist"));
  }

  const match = await bcrypt.compare(password, user.password);
  if (!match) {
    return next(createHttpError(400, "Incorrect User credentials"));
  }
  const { password: _, ...withoutPass } = user;
  const accessToken = jwt.sign(
    {
      id: user.id,
      role: user.role,
    },
    Config.ACCESS_TOKEN_SECRET!
  );
  returnResponse = {
    data: { ...withoutPass, accessToken },
    message: `${role} logged in Successfully`,
    status: "success",
  };
  return res.status(200).json(returnResponse);
};

export const registerTourist = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const { email, fname, lname, phone, members, password } = req.body;
  const emailExists = await prisma.tourist.findUnique({ where: { email } });
  if (emailExists) {
    return next(createHttpError("400", "Email already taken"));
  }

  const hashedPw = await bcrypt.hash(password, 10);
  const user = await prisma.tourist.create({
    data: {
      email,
      fname,
      lname,
      phone,
      members,
      password: hashedPw,
    },
  });

  if (!user) return next(createHttpError(500, "Internal Server error"));
  const accessToken = jwt.sign(
    {
      id: user.id,
      role: user.role,
    },
    Config.ACCESS_TOKEN_SECRET!
  );

  const { password: _, ...withoutPass } = user;
  returnResponse = {
    data: {
      ...withoutPass,
      accessToken,
    },
    message: `${user.role} successfully logged in`,
    status: "success",
  };
  return res.status(201).json(returnResponse);
};

export const registerGuide = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let returnResponse: IReturnResponse;
  const { email, fname, lname, phone, password } = req.body;

  const emailExists = await prisma.guide.findUnique({ where: { email } });
  if (emailExists) {
    return next(createHttpError("400", "Email already taken"));
  }
  const hashedPw = await bcrypt.hash(password, 10);
  const image = req.file;
  let user;
  if (image) {
    const uploaded = await uploadOnCloudinary(image!.path);
    if (!uploaded) {
      return next(createHttpError(400, "unable to upload image"));
    }
    user = await prisma.guide.create({
      data: {
        email,
        fname,
        lname,
        phone,
        photo: uploaded[0]!.secure_url,
        password: hashedPw,
      },
    });
  }
  user = await prisma.guide.create({
    data: {
      email,
      fname,
      lname,
      phone,
      password: hashedPw,
    },
  });

  if (!user) return next(createHttpError(500, "Internal Server error"));
  const { password: _, ...withoutPass } = user;
  const accessToken = jwt.sign(
    {
      id: user.id,
      role: user.role,
    },
    Config.ACCESS_TOKEN_SECRET!
  );
  returnResponse = {
    data: {
      ...withoutPass,
      accessToken,
    },
    message: `${user.role} successfully logged in`,
    status: "success",
  };
  return res.status(201).json(returnResponse);
};
