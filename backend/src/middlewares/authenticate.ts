import { NextFunction, Request, Response } from "express";
import * as Config from "../config";
import jwt from "jsonwebtoken";

import createHttpError from "http-errors";
const authenticate = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const token = req.header("Authorization");
  if (!token) {
    return next(createHttpError(401, "unAuthorized"));
  }
  const splittedToken = token.split(" ")[1];
  jwt.verify(
    splittedToken,
    Config.ACCESS_TOKEN_SECRET!,
    (err: any, decoded: any) => {
      if (err) {
        if (err.name === "TokenExpiredError") {
          return next(createHttpError(401, "Token expired"));
        } else {
          return next(createHttpError(403, "forbidden"));
        }
      }
      req.user = decoded;
    }
  );

  next();
};
export default authenticate;
