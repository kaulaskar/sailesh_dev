import time
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Main page"

@app.route('/hello')
def hellovamsi():
    return "Hello From sailesh"

@app.route('/health')
def health():
    return "Service is healthy"

@app.route('/healthz')
def healthz():
    return "Service Z is healthy"

@app.route('/healthx')
def healthx():
    time.sleep(1);
    return "Service X is healthy"

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)