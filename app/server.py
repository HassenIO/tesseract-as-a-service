from flask import Flask, request
from werkzeug.utils import secure_filename
import pytesseract


app = Flask(__name__)


@app.route('/ocr', methods=['POST'])
def run_ocr():
	f = request.files['file']
	file_name = 'tmp/' + secure_filename(f.filename)
	f.save(file_name)

	text = pytesseract.image_to_string(file_name, timeout=10)
	return f'text={text}'


if __name__ == '__main__':
	app.run(host="0.0.0.0", port=5000, debug=True)

