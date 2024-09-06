from flask import Flask, jsonify, request, make_response, redirect
from werkzeug.utils import secure_filename

import json

app = Flask(__name__)
app.config['MAX_CONTEBT_LENGTH'] = 500*1024*1024

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

    return """<form method=post enctype=multipart/form-data><input style="height: 300px; width: 300px; background-color: darkorange;" type=file name=thefile onchange="form.submit();" /><input type=submit></form>"""

if __name__ == '__main__':
    # https://flask.palletsprojects.com/en/2.3.x/patterns/fileuploads/
    # http://127.0.0.1:6580/
    app.run(host='127.0.0.1', port=6580, debug=True)
