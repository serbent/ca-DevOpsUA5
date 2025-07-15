from flask import Flask, jsonify, request, render_template, redirect, url_for, session

app = Flask(__name__)
app.secret_key = 'a8f3b2c7e9d4f6a1'

@app.route('/')
def index():
    return render_template('login.html')


if __name__ == '__main__':
    app.run(debug=True, host='localhost', port=5000)