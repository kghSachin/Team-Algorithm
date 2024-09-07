import multer from "multer";
import path from "node:path";

const upload = multer({
  dest: path.join(__dirname, "../../public/assets"),
});

export default upload;
