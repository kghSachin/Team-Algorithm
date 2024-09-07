import { NextFunction, Request, Response } from "express";
import createHttpError from "http-errors";


const asyncErrorHandler =
  (fn: Function) => async (req: Request, res: Response, next: NextFunction) => {
    try {
      await fn(req, res, next);
    } catch (err: any) {
      return next(createHttpError(500, err.message));
    }
  };

export default asyncErrorHandler;
