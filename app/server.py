from flask import Flask


app = Flask(__name__)


@app.route('/ocr', methods=['POST'])
def run_ocr():
	return 'hello world'


if __name__ == '__main__':
	app.run(debug=True)

