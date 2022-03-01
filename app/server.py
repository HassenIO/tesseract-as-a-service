from flask import Flask, request
from werkzeug.utils import secure_filename


app = Flask(__name__)


@app.route('/ocr', methods=['POST'])
def run_ocr():
	f = request.files['file']
	file_name = 'tmp/' + secure_filename(f.filename)
	f.save(file_name)
	return f'hello world = {file_name}'


if __name__ == '__main__':
	app.run(debug=True)

