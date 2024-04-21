A web framework is a collection of tools, libraries, and conventions that provide developers with a structured way to build and maintain web applications. It typically includes components for handling HTTP requests, managing routing, interacting with databases, rendering templates, and more.

Flask is a lightweight and flexible web framework for Python. It provides the tools necessary to build web applications quickly and easily.

To build a web framework with Flask, follow these steps:

Install Flask:
Copy code
pip install Flask
Create a new Python file, for example, app.py.
Import Flask and create a Flask application instance:
python
Copy code
from flask import Flask
app = Flask(__name__)
Define routes using the @app.route decorator. A route is a URL pattern associated with a particular function.
python
Copy code
@app.route('/')
def index():
    return 'Hello, World!'
Handle variables in a route by specifying them within the route pattern and accessing them as function parameters.
python
Copy code
@app.route('/user/<username>')
def show_user_profile(username):
    return f'User {username}'
Templates in Flask are HTML files with placeholders for dynamic content. You can use Jinja2 templating engine for dynamic content.
To render a template, use the render_template function provided by Flask.
python
Copy code
from flask import render_template

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)
Create dynamic templates by using Jinja2 syntax for loops, conditions, and variables.

<!DOCTYPE html>
<html>
<head>
    <title>Hello</title>
</head>
<body>
    {% if name %}
        <h1>Hello, {{ name }}!</h1>
    {% else %}
        <h1>Hello, World!</h1>
    {% endif %}
</body>
</html>
To display data from a MySQL database in HTML, you first need to connect to the database using a library like Flask-MySQL or SQLAlchemy. Then, query the database and pass the data to your template for rendering.
Here's a basic example of querying data from a MySQL database and displaying it in a template:

python
Copy code
from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'username'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = 'database'

mysql = MySQL(app)

@app.route('/users')
def users():
    cur = mysql.connection.cursor()
    cur.execute("SELECT username FROM users")
    users = cur.fetchall()
    cur.close()
    return render_template('users.html', users=users)
In the users.html template:


<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
</head>
<body>
    <h1>Users</h1>
    <ul>
        {% for user in users %}
            <li>{{ user.username }}</li>
        {% endfor %}
    </ul>
</body>
</html>
This example assumes you have a MySQL database named 'database' with a table named 'users' containing a 'username' column. Adjust the configuration and SQL query as needed for your setup.
