from flask import Flask, render_template

app = Flask(__name__)

@app.route('/hello/<name>')
def hello_world(name):
    names = {'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Heidi', 'Ivan', 'Judy', 'Karl', 'Leo', 'Mallory', 'Nina', 'Oscar', 'Peggy', 'Quentin', 'Rupert', 'Sybil', 'Trent', 'Uma', 'Victor', 'Walter', }
    return render_template('hello.html', name=name, names=names)