// validateRequest.ts
import { NextFunction, Request, Response } from "express";
import { AnyZodObject, ZodError } from "zod";

const validateRequest =
  (schema: AnyZodObject) =>
  (req: Request, res: Response, next: NextFunction) => {
    try {
      schema.parse({
        body: req.body,
        
      });
      next();
    } catch (error) {
      if (error instanceof ZodError) {
        // Construct a detailed error message
        const errorDetails = error.errors.map((err) => ({
          field: err.path.join("."),
          message: err.message,
        }));

        res.status(400).json({
          success: false,
          message: "Validation error",
          errorDetails: {
            issues: errorDetails,
          },
        });
      } else {
        next(error);
      }
    }
  };

export default validateRequest;
