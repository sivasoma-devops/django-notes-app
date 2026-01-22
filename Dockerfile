FROM python:3.9-slim

WORKDIR /app

# Install MySQL dependencies
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run server
CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]
