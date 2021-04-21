from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def welcome():
    return jsonify({"status": 200, "message": "Welcome to my app!"})


app.run(debug=True, host='0.0.0.0')