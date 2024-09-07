import { NextFunction, Request, Response } from "express";
import prisma from "../utils/prisma";
import { IReturnResponse } from "../types";
import createHttpError from "http-errors";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import * as Config from "../config";

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
  returnResponse = {
    data: withoutPass,
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
      email: user.email,
    },
    Config.ACCESS_TOKEN_SECRET!
  );
  returnResponse = {
    data: {
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
  const { email, fname, lname, phone, members, password } = req.body;
  const hashedPw = await bcrypt.hash(password, 10);
  const user = await prisma.guide.create({
    data: {
      email,
      fname,
      lname,
      phone,
      password: hashedPw,
    },
  });
  if (!user) return next(createHttpError(500, "Internal Server error"));
  const accessToken = jwt.sign(
    {
      id: user.id,
      email: user.email,
    },
    Config.ACCESS_TOKEN_SECRET!
  );
  returnResponse = {
    data: {
      accessToken,
    },
    message: `${user.role} successfully logged in`,
    status: "success",
  };
  return res.status(201).json(returnResponse);
};
