FROM python:3.7

# Copy your application code into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Upgrade pip within the virtual environment
RUN pip install --upgrade pip

# Install required dependencies
RUN pip install -r requirements.txt

# Expose the port (replace PORT_NUMBER with the actual port)
EXPOSE 8000

# Command to run your application (modify as needed)
CMD gunicorn --workers=4 --bind 0.0.0.0:8000 app:app
