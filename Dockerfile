FROM tensorflow/tensorflow:2.14.0-gpu

# Set working directory
WORKDIR /app

# Ensure system tools are installed
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy Python dependencies
COPY requirements.txt .
COPY requirements-lock.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r requirements-lock.txt

# (Optional) Install Jupyter for interactive dev
RUN pip install notebook

# Expose Jupyter port or app port
EXPOSE 8888

# Default to interactive bash (you can override in docker-compose)
CMD ["sleep", "infinity"]
