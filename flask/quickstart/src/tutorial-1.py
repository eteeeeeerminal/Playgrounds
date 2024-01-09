from flask import Flask, url_for, render_template
from markupsafe import escape

app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello_world():
    return '<p>Hello, World!</p>'

@app.route('/hello/<name>')
def hello(name):
    return f'Hello, {escape(name)}'

@app.route('/hello-loop/<int:times>')
def hello_loop(times):
    return '<br/>'.join(['hello' for _ in range(times)])

@app.route('/projects/')
def projects():
    return 'projects'

@app.route('/about')
def about():
    return 'about'

@app.route('/hello-template/')
@app.route('/hello-template/<name>')
def hello_template(name=None):
    return render_template('hello.html', name=name)


with app.test_request_context():
    print(url_for('index'))
    print(url_for('hello_world'))
    print(url_for('hello_world', next='hoge'))
    print(url_for('hello', name='name'))



