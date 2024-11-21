# Project Setup Scripts Guide

This guide explains how to use the provided scripts to quickly set up new Python projects with best practices for structure, Git integration, AI/ML development, and web applications.

## 📁 Available Scripts

1. `git_init_project.bat` - Initializes Git repository and sets up .gitignore
2. `setup_project_structure.bat` - Creates project directory structure and common files
3. `setup_venv.bat` - Sets up Python virtual environment with AI/ML libraries
4. `activate_venv.bat` - Activates the virtual environment
5. `gitignore_template` - Template for Python project .gitignore file
6. `git_utils.bat` - Utility script for common Git operations

## 🚀 Quick Start

1. Copy these files to your new project directory:
   ```
   git_init_project.bat
   setup_project_structure.bat
   setup_venv.bat
   activate_venv.bat
   git_utils.bat
   gitignore_template
   requirements.txt
   requirements-dev.txt
   ```

2. Set up the project structure:
   ```bash
   setup_project_structure.bat
   ```

3. Set up the virtual environment:
   ```bash
   setup_venv.bat
   ```

4. Initialize git:
   ```bash
   git_init_project.bat
   ```

5. Initialize the database:
   ```bash
   flask db init
   flask db migrate -m "Initial migration"
   flask db upgrade
   ```

## 🔄 Git Version Control

### Git Utilities Script

The `git_utils.bat` script provides an interactive menu for common Git operations:

1. **Stage and Commit All Changes**
   ```bash
   # Option 1 in the menu
   # Stages all changes and commits with a message
   ```

2. **Stage and Commit Specific Files**
   ```bash
   # Option 2 in the menu
   # Shows current status and allows selecting specific files
   ```

3. **Conventional Commits**
   ```bash
   # Option 3 in the menu
   # Commit with type (feat, fix, docs, etc.)
   feat(auth): add user authentication
   fix(api): resolve connection timeout
   docs(readme): update installation steps
   ```

4. **Branch Management**
   ```bash
   # Option 5 in the menu
   # Create and switch to a new branch
   ```

### Common Git Workflows

1. **Feature Development**
   ```bash
   git_utils.bat
   # Select 5 to create new branch
   # Make changes
   # Select 1 to commit all changes
   # Select 4 to push changes
   ```

2. **Quick Fixes**
   ```bash
   git_utils.bat
   # Select 3 for typed commit
   # Choose 'fix' as type
   # Enter description
   ```

3. **Documentation Updates**
   ```bash
   git_utils.bat
   # Select 3 for typed commit
   # Choose 'docs' as type
   # Enter description
   ```

## 📂 Created Project Structure

```
your-project/
├── src/
│   ├── __init__.py
│   ├── templates/          # Jinja2 templates
│   │   ├── base.html      # Base template with Bootstrap
│   │   └── index.html     # Home page template
│   ├── static/            # Static files
│   │   ├── css/          # CSS files
│   │   ├── js/           # JavaScript files
│   │   ├── img/          # Images
│   │   └── uploads/      # User uploads
│   ├── blueprints/        # Flask blueprints
│   │   └── main/         # Main blueprint
│   ├── models/           # Database models
│   ├── services/         # Business logic
│   ├── utils/           # Utility functions
│   ├── tasks/           # Background tasks
│   └── api/             # API endpoints
├── tests/
├── docs/
├── config/
│   └── config.py
├── logs/
├── instance/
├── migrations/          # Database migrations
├── notebooks/
│   ├── exploratory/
│   └── models/
├── data/
│   ├── raw/
│   └── processed/
├── private/
├── .env
├── .env.example
├── requirements.txt
└── requirements-dev.txt
```

## 🌐 Web Application Features

### Flask Application Structure

The project uses a factory pattern with blueprints:

```python
# src/__init__.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

db = SQLAlchemy()
migrate = Migrate()

def create_app():
    app = Flask(__name__)
    # ... configuration and initialization
    return app
```

### Templates with Bootstrap 5

Base template (`templates/base.html`) includes:
- Bootstrap 5 CSS and JS
- Responsive navigation
- Content blocks for customization
- Custom CSS and JS integration

### Database Integration

Using SQLAlchemy with migrations:

```python
# Example model
from src import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
```

Database commands:
```bash
flask db init          # Initialize migrations
flask db migrate       # Create a migration
flask db upgrade      # Apply migrations
```

### API Development

The project includes both REST and GraphQL support:

1. REST API with Flask-RESTful:
   ```python
   from flask_restful import Resource, Api
   
   class UserResource(Resource):
       def get(self, user_id):
           return {'user': user_id}
   ```

2. FastAPI integration available for modern API development

### Background Tasks

Celery integration for background processing:

```python
from src.tasks import celery

@celery.task
def process_data(data):
    # Long-running task
    pass
```

### WebSocket Support

Real-time communication with Flask-SocketIO:

```python
from flask_socketio import SocketIO, emit

socketio = SocketIO()

@socketio.on('connect')
def handle_connect():
    emit('response', {'data': 'Connected'})
```

## 🔒 Security Features

1. CSRF Protection:
   ```python
   from flask_wtf.csrf import CSRFProtect
   csrf = CSRFProtect(app)
   ```

2. JWT Authentication:
   ```python
   from flask_jwt_extended import jwt_required
   
   @app.route('/api/protected')
   @jwt_required()
   def protected():
       return {'status': 'success'}
   ```

## 📊 ML/AI Integration

### Web Interface for ML Models

Example of serving ML models via Flask:

```python
from src.models.ml import MLModel

model = MLModel()

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    prediction = model.predict(data)
    return {'prediction': prediction}
```

### Jupyter Integration

Access notebooks at:
- `notebooks/exploratory/` for data analysis
- `notebooks/models/` for model development

## 🔧 Customization

### Adding New Routes

1. Create a new blueprint:
   ```python
   # src/blueprints/new_feature/__init__.py
   from flask import Blueprint
   bp = Blueprint('new_feature', __name__)
   ```

2. Register in `src/__init__.py`:
   ```python
   from src.blueprints.new_feature import bp as new_feature_bp
   app.register_blueprint(new_feature_bp, url_prefix='/new-feature')
   ```

### Adding Static Files

1. CSS: Add to `src/static/css/`
2. JavaScript: Add to `src/static/js/`
3. Images: Add to `src/static/img/`

### Database Migrations

When modifying models:
```bash
flask db migrate -m "Add new field"
flask db upgrade
```

## 🚨 Common Issues

1. **Database Migrations**:
   - Issue: `Target database is not up to date`
   - Solution: Run `flask db stamp head` then `flask db upgrade`

2. **Static Files Not Loading**:
   - Check file paths in templates
   - Ensure `flask run` is run from project root

3. **Package Conflicts**:
   ```bash
   pip install --upgrade --force-reinstall -r requirements.txt
   ```

## 📚 Additional Resources

- [Flask Documentation](https://flask.palletsprojects.com/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)
- [Bootstrap Documentation](https://getbootstrap.com/docs/)
- [Celery Documentation](https://docs.celeryproject.org/)

## 📊 Using Jupyter Notebooks

After activating the virtual environment:

1. Start Jupyter Notebook:
   ```bash
   jupyter notebook
   ```

2. Start JupyterLab (modern interface):
   ```bash
   jupyter lab
   ```

The environment includes a custom kernel named "Python (Local ML Env)".

## 🔒 Private Directory Usage

The `private/` directory is automatically git-ignored and is perfect for:

1. Sensitive configurations:
   ```python
   # private/config.private.py
   API_KEYS = {
       'production': 'your-prod-key',
       'development': 'your-dev-key'
   }
   ```

2. Secret algorithms or proprietary code:
   ```python
   # private/proprietary_algorithm.py
   def secret_business_logic():
       # Your proprietary code here
       pass
   ```

3. Local development utilities:
   ```python
   # private/local_utils.py
   def development_only_helper():
       # Local development helpers
       pass
   ```

## 💻 Environment Variables

Two environment files are created:

1. `.env.example` (committed to git):
   ```env
   SECRET_KEY=your-secret-key-here
   DEBUG=True
   DATABASE_URL=sqlite:///./app.db
   API_KEY=your-api-key-here
   ```

2. `.env` (git-ignored):
   ```env
   SECRET_KEY=development-key
   DEBUG=True
   DATABASE_URL=sqlite:///./app.db
   API_KEY=development-key
   ```

## 📝 Example Usage in Code

1. Accessing environment variables:
   ```python
   from config.config import Config
   
   debug_mode = Config.DEBUG
   database_url = Config.DATABASE_URL
   ```

2. Using private configurations:
   ```python
   # In your main code
   try:
       from private.config.private import API_KEYS
       api_key = API_KEYS['production']
   except ImportError:
       # Fall back to environment variable
       import os
       api_key = os.getenv('API_KEY')
   ```

## 📊 Example ML Project Structure

```
your-project/
├── notebooks/              # Jupyter notebooks for experiments
│   ├── exploratory/       # Data exploration
│   └── models/           # Model development
├── src/
│   ├── data/             # Data processing scripts
│   ├── models/           # Model definitions
│   ├── training/         # Training scripts
│   └── evaluation/       # Model evaluation
├── tests/
├── data/                 # Data files (git-ignored)
│   ├── raw/             # Original data
│   └── processed/       # Processed data
├── models/              # Saved models (git-ignored)
├── private/             # Private configurations
└── config/
    └── model_config.py  # Model configurations
```

## 📝 Example Usage

### Loading Data with Pandas
```python
import pandas as pd
import numpy as np

# Load data
data = pd.read_csv('data/raw/dataset.csv')

# Basic preprocessing
data = data.dropna()
X = data.drop('target', axis=1)
y = data['target']
```

### Training a Model
```python
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Train model
model = RandomForestClassifier()
model.fit(X_train, y_train)

# Evaluate
score = model.score(X_test, y_test)
print(f"Model accuracy: {score:.2f}")
```

### Deep Learning with PyTorch
```python
import torch
import torch.nn as nn

class SimpleNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Linear(input_size, 128),
            nn.ReLU(),
            nn.Linear(128, num_classes)
        )
    
    def forward(self, x):
        return self.layers(x)
```

## 🔧 Customizing Dependencies

To add new packages:

1. Add to `requirements.txt` or `requirements-dev.txt`
2. Reinstall dependencies:
   ```bash
   pip install -r requirements-dev.txt
   ```

## 🚨 Common Issues

1. **GPU Support**: For GPU support, install the appropriate CUDA toolkit for TensorFlow/PyTorch

2. **Memory Issues**: When working with large datasets:
   ```python
   # Read data in chunks
   data = pd.read_csv('large_file.csv', chunksize=10000)
   
   # Or use memory-efficient datatypes
   data = pd.read_csv('large_file.csv', dtype={'column': 'category'})
   ```

3. **Package Conflicts**: If you encounter conflicts:
   ```bash
   pip install --upgrade --force-reinstall -r requirements.txt
   ```

## 🔍 Best Practices

1. Never commit sensitive information to git
2. Always use the `private/` directory for sensitive code
3. Keep `.env.example` updated with all required variables
4. Document any changes to the project structure
5. Update requirements files when adding new dependencies

## 📚 Additional Resources

- [Python Project Structure Guide](https://docs.python-guide.org/writing/structure/)
- [Git Documentation](https://git-scm.com/doc)
- [Python dotenv Documentation](https://github.com/theskumar/python-dotenv)

## 🤝 Contributing

Feel free to modify these scripts for your specific needs. Consider:

1. Adding support for different project types
2. Creating versions for different operating systems
3. Adding more configuration templates
4. Expanding the private directory structure
5. Adding new Git utilities

## 📄 License

These scripts are provided as-is under the MIT license. Feel free to modify and distribute them as needed.
