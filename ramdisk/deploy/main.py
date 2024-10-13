from flask import Flask, jsonify, request, make_response
import json

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def X():
    return(jsonify({'started': 1}))

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=6580, debug=True)
