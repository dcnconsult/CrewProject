@echo off
echo Creating Python virtual environment...

:: Check if Python is installed
python --version > nul 2>&1
if errorlevel 1 (
    echo Python is not installed or not in PATH
    echo Please install Python from https://www.python.org/downloads/
    pause
    exit /b 1
)

:: Check if virtual environment exists
if exist venv (
    echo Virtual environment already exists
    choice /M "Do you want to recreate it"
    if errorlevel 2 goto activate_venv
    rmdir /s /q venv
)

:: Create virtual environment
echo Creating new virtual environment...
python -m venv venv

:activate_venv
:: Activate virtual environment
call venv\Scripts\activate.bat

:: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Install dependencies
echo Installing dependencies...
echo Installing development dependencies...
pip install -r requirements-dev.txt

:: Install additional NLP models
echo Installing spaCy English model...
python -m spacy download en_core_web_sm

:: Install NLTK data
echo Installing NLTK data...
python -c "import nltk; nltk.download('punkt'); nltk.download('averaged_perceptron_tagger'); nltk.download('wordnet')"

:: Create Jupyter kernel
echo Creating Jupyter kernel...
python -m ipykernel install --user --name=venv --display-name="Python (Local ML Env)"

echo Virtual environment setup complete!
echo To activate the virtual environment, run: venv\Scripts\activate.bat
echo To deactivate, run: deactivate
pause
