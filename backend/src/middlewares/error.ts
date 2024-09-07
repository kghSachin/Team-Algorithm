import { HttpError } from "http-errors";
import { IReturnResponse } from "./../types/index";
import { NextFunction, Response, Request } from "express";

const error = (
  err: HttpError,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server error";
  let returnResponse: IReturnResponse = {
    status: "error",
    data: {},
    message,
  };
  return res.status(statusCode).json(returnResponse);
};

export default error;
