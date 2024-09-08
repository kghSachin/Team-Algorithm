import * as Config from "./config";

import app from "./app";
import prisma from "./utils/prisma";

prisma
  .$connect()
  .then(async () => {
    console.log("Database successfully connected and running");
    app.listen(Config.PORT!, () => {
      console.log(`Server is running at port ${Config.PORT}`);
    });
    
  })
  .catch((err) => {
    console.log(err);
  });
