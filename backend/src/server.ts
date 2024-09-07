import * as Config from "./config";

import app from "./app";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

prisma
  .$connect()
  .then(() => {
    console.log("Database successfully connected and running");
    app.listen(Config.PORT!, () => {
      console.log(`Server is running at port ${Config.PORT}`);
    });
    
  })
  .catch((err) => {
    console.log(err);
    
  });
