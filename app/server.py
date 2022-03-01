from flask import Flask, request
from werkzeug.utils import secure_filename
import pytesseract
import json


app = Flask(__name__)


@app.route('/ocr', methods=['POST'])
def run_ocr():
	f = request.files['file']
	file_name = 'tmp/' + secure_filename(f.filename)
	f.save(file_name)

	content = pytesseract.image_to_string(file_name, timeout=10)
	return json.dumps({"content": content})


if __name__ == '__main__':
	app.run(host="0.0.0.0", port=5000, debug=True)

