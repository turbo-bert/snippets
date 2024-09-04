from flask import Flask, jsonify, request, make_response, redirect
from werkzeug.utils import secure_filename

import json

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def X():
    if request.method == "POST":
        if 'thefile' not in request.files:
            return redirect(request.url)
        else:
            file = request.files['thefile']
            if file.filename == "":
                return redirect(request.url)
            if file and True:
                file.save("TEST")
                return redirect(request.url)

    return """<form method=post enctype=multipart/form-data><input type=file name=thefile /><input type=submit></form>"""

if __name__ == '__main__':
    # http://127.0.0.1:6580/
    app.run(host='127.0.0.1', port=6580, debug=True)
