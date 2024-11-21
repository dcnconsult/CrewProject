@echo off
echo Creating project directory structure...

:: Create main project directories
mkdir private
mkdir src
mkdir tests
mkdir docs
mkdir config
mkdir logs
mkdir instance
mkdir data
mkdir data\raw
mkdir data\processed

:: Create web application structure
mkdir src\templates
mkdir src\static
mkdir src\static\css
mkdir src\static\js
mkdir src\static\img
mkdir src\static\uploads
mkdir src\blueprints
mkdir src\models
mkdir src\services
mkdir src\utils
mkdir src\tasks
mkdir src\api

:: Create notebooks directory
mkdir notebooks
mkdir notebooks\exploratory
mkdir notebooks\models

:: Create common configuration files
echo # Environment Variables > .env.example
echo SECRET_KEY=your-secret-key-here >> .env.example
echo DEBUG=True >> .env.example
echo DATABASE_URL=sqlite:///./app.db >> .env.example
echo API_KEY=your-api-key-here >> .env.example
echo FLASK_APP=src/__init__.py >> .env.example
echo FLASK_ENV=development >> .env.example

echo # Environment Variables > .env
echo SECRET_KEY=development-key >> .env
echo DEBUG=True >> .env
echo DATABASE_URL=sqlite:///./app.db >> .env
echo API_KEY=development-key >> .env
echo FLASK_APP=src/__init__.py >> .env
echo FLASK_ENV=development >> .env

:: Create requirements files
echo # Core dependencies > requirements.txt
echo python-dotenv >> requirements.txt
echo requests >> requirements.txt
echo flask >> requirements.txt
echo flask_sqlalchemy >> requirements.txt
echo flask_migrate >> requirements.txt
echo flask_login >> requirements.txt
echo flask_cors >> requirements.txt

echo # Development dependencies > requirements-dev.txt
echo -r requirements.txt >> requirements-dev.txt
echo pytest >> requirements-dev.txt
echo black >> requirements-dev.txt
echo flake8 >> requirements-dev.txt
echo mypy >> requirements-dev.txt

:: Create README
echo # Project Name > README.md
echo. >> README.md
echo ## Description >> README.md
echo Add your project description here. >> README.md
echo. >> README.md
echo ## Installation >> README.md
echo 1. Clone the repository >> README.md
echo 2. Create a virtual environment: `python -m venv venv` >> README.md
echo 3. Activate the virtual environment: >> README.md
echo    - Windows: `venv\Scripts\activate` >> README.md
echo    - Unix/MacOS: `source venv/bin/activate` >> README.md
echo 4. Install dependencies: `pip install -r requirements.txt` >> README.md
echo 5. Copy `.env.example` to `.env` and configure your environment variables >> README.md
echo. >> README.md
echo ## Usage >> README.md
echo 1. Activate the virtual environment >> README.md
echo 2. Run `flask run` to start the development server >> README.md
echo 3. Visit `http://localhost:5000` in your browser >> README.md

:: Create initial Python files
:: Main application
echo # Main application file > src/__init__.py
echo from flask import Flask >> src/__init__.py
echo from flask_sqlalchemy import SQLAlchemy >> src/__init__.py
echo from flask_migrate import Migrate >> src/__init__.py
echo from flask_login import LoginManager >> src/__init__.py
echo from flask_cors import CORS >> src/__init__.py
echo from config.config import Config >> src/__init__.py
echo. >> src/__init__.py
echo db = SQLAlchemy() >> src/__init__.py
echo migrate = Migrate() >> src/__init__.py
echo login_manager = LoginManager() >> src/__init__.py
echo. >> src/__init__.py
echo def create_app(config_class=Config): >> src/__init__.py
echo     app = Flask(__name__) >> src/__init__.py
echo     app.config.from_object(config_class) >> src/__init__.py
echo. >> src/__init__.py
echo     # Initialize extensions >> src/__init__.py
echo     db.init_app(app) >> src/__init__.py
echo     migrate.init_app(app, db) >> src/__init__.py
echo     login_manager.init_app(app) >> src/__init__.py
echo     CORS(app) >> src/__init__.py
echo. >> src/__init__.py
echo     # Register blueprints >> src/__init__.py
echo     from src.blueprints.main import bp as main_bp >> src/__init__.py
echo     app.register_blueprint(main_bp) >> src/__init__.py
echo. >> src/__init__.py
echo     return app >> src/__init__.py

:: Configuration
echo # Configuration file > config/config.py
echo import os >> config/config.py
echo from dotenv import load_dotenv >> config/config.py
echo. >> config/config.py
echo load_dotenv() >> config/config.py
echo. >> config/config.py
echo class Config: >> config/config.py
echo     SECRET_KEY = os.getenv('SECRET_KEY', 'dev') >> config/config.py
echo     DEBUG = os.getenv('DEBUG', 'False').lower() == 'true' >> config/config.py
echo     SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'sqlite:///./app.db') >> config/config.py
echo     SQLALCHEMY_TRACK_MODIFICATIONS = False >> config/config.py

:: Create blueprint
mkdir src\blueprints\main
echo # Blueprint initialization > src\blueprints\main\__init__.py
echo from flask import Blueprint >> src\blueprints\main\__init__.py
echo. >> src\blueprints\main\__init__.py
echo bp = Blueprint('main', __name__) >> src\blueprints\main\__init__.py
echo. >> src\blueprints\main\__init__.py
echo from src.blueprints.main import routes >> src\blueprints\main\__init__.py

echo # Routes > src\blueprints\main\routes.py
echo from flask import render_template >> src\blueprints\main\routes.py
echo from src.blueprints.main import bp >> src\blueprints\main\routes.py
echo. >> src\blueprints\main\routes.py
echo @bp.route('/') >> src\blueprints\main\routes.py
echo def index(): >> src\blueprints\main\routes.py
echo     return render_template('index.html') >> src\blueprints\main\routes.py

:: Create templates
echo ^<!DOCTYPE html^> > src\templates\base.html
echo ^<html lang="en"^> >> src\templates\base.html
echo ^<head^> >> src\templates\base.html
echo     ^<meta charset="UTF-8"^> >> src\templates\base.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> src\templates\base.html
echo     ^<title^>{% block title %}{% endblock %} - My App^</title^> >> src\templates\base.html
echo     ^<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"^> >> src\templates\base.html
echo     ^<link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}"^> >> src\templates\base.html
echo     {% block styles %}{% endblock %} >> src\templates\base.html
echo ^</head^> >> src\templates\base.html
echo ^<body^> >> src\templates\base.html
echo     ^<nav class="navbar navbar-expand-lg navbar-dark bg-dark"^> >> src\templates\base.html
echo         ^<div class="container"^> >> src\templates\base.html
echo             ^<a class="navbar-brand" href="{{ url_for('main.index') }}"^>My App^</a^> >> src\templates\base.html
echo         ^</div^> >> src\templates\base.html
echo     ^</nav^> >> src\templates\base.html
echo     ^<main class="container mt-4"^> >> src\templates\base.html
echo         {% block content %}{% endblock %} >> src\templates\base.html
echo     ^</main^> >> src\templates\base.html
echo     ^<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"^>^</script^> >> src\templates\base.html
echo     ^<script src="{{ url_for('static', filename='js/main.js') }}"^>^</script^> >> src\templates\base.html
echo     {% block scripts %}{% endblock %} >> src\templates\base.html
echo ^</body^> >> src\templates\base.html
echo ^</html^> >> src\templates\base.html

echo {% extends "base.html" %} > src\templates\index.html
echo {% block title %}Home{% endblock %} >> src\templates\index.html
echo {% block content %} >> src\templates\index.html
echo ^<div class="jumbotron"^> >> src\templates\index.html
echo     ^<h1 class="display-4"^>Welcome to My App^</h1^> >> src\templates\index.html
echo     ^<p class="lead"^>This is a sample application with Flask and Bootstrap.^</p^> >> src\templates\index.html
echo ^</div^> >> src\templates\index.html
echo {% endblock %} >> src\templates\index.html

:: Create static files
echo /* Custom styles */ > src\static\css\style.css
echo body { >> src\static\css\style.css
echo     padding-top: 20px; >> src\static\css\style.css
echo } >> src\static\css\style.css

echo // Main JavaScript file > src\static\js\main.js
echo console.log('Application initialized'); >> src\static\js\main.js

:: Create initial test file
echo import pytest > tests/__init__.py
echo from src import create_app >> tests/__init__.py
echo from config.config import Config >> tests/__init__.py
echo. >> tests/__init__.py
echo class TestConfig(Config): >> tests/__init__.py
echo     TESTING = True >> tests/__init__.py
echo     SQLALCHEMY_DATABASE_URI = 'sqlite://' >> tests/__init__.py
echo. >> tests/__init__.py
echo @pytest.fixture >> tests/__init__.py
echo def app(): >> tests/__init__.py
echo     app = create_app(TestConfig) >> tests/__init__.py
echo     return app >> tests/__init__.py

echo # Add your tests here > tests/test_app.py
echo from src import create_app >> tests/test_app.py
echo. >> tests/test_app.py
echo def test_index_page(client): >> tests/test_app.py
echo     response = client.get('/') >> tests/test_app.py
echo     assert response.status_code == 200 >> tests/test_app.py

:: Create database migrations directory
mkdir migrations

:: Create private directory with example
echo # Private configuration > private/config.private.py
echo # Add your sensitive configurations here >> private/config.private.py
echo API_KEY = "your-secret-api-key" >> private/config.private.py

echo Project structure has been created successfully!
echo Remember to:
echo 1. Review and modify the .env file with your actual configuration
echo 2. Update requirements.txt with your project's specific dependencies
echo 3. Initialize the database with 'flask db init'
echo 4. Create your first migration with 'flask db migrate'
echo 5. Apply the migration with 'flask db upgrade'
pause
