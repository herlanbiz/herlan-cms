from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello world!'


@app.route('/about')
def about():
    return 'Saya Herlan'


app.run( host='localhost', debug=True, port=8092 )
