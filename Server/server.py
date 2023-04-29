from flask import Flask
import logging
import os

log = logging.getLogger("werkzeug")
log.setLevel(logging.ERROR)

app = Flask(__name__)

@app.route("/script/<path>")
def get_file(path):
    path = os.path.join("script", path)
    print(path)

    return open(path, "r").read()

app.run()