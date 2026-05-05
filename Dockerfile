FROM python:3.11-slim

WORKDIR /app

# Install system dependencies from your packages.txt
RUN apt-get update && apt-get install -y \
    $(cat packages.txt) \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Streamlit uses
EXPOSE 8501

# Run the app
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
