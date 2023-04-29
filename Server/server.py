from flask import Flask
import logging
import os
import time

log = logging.getLogger("werkzeug")
log.setLevel(logging.ERROR)

app = Flask(__name__)

@app.route("/script/<path:path>")
def get_file(path):
    file_path = os.path.join("../", path)
    print(time.strftime(f"%H:%M:%S => {path}"))

    return open(file_path, "r").read()

@app.route("/script/Modules<path>")
def get_module(path):
    file_path = os.path.join("../", path)
    print(time.strftime(f"%H:%M:%S => {path}"))

    return open(file_path, "r").read()

print("Starting on url 127.0.0.1:5000")
app.run()