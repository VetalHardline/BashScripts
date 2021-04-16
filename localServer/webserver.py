from flask import Flask
from flask import request
 
app = Flask(__name__)
 
@app.route("/", methods=['GET'])
def index():
	return "Hi :3"
 
if __name__ == "__main__":
	app.run(host='0.0.0.0', port=8080)
