from flask import Flask, request
from werkzeug.utils import secure_filename
import pytesseract
import json
import os


app = Flask(__name__)
SERVER_PORT = os.getenv("PORT", 5055)


@app.route("/ocr", methods=["POST"])
def run_ocr():
    f = request.files["file"]
    file_name = "tmp/" + secure_filename(f.filename)
    f.save(file_name)

    content = pytesseract.image_to_string(file_name, timeout=10)
    return json.dumps({"content": content})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=SERVER_PORT, debug=True)
