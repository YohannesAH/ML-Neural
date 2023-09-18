# Use an Alpine base image
FROM alpine:latest

# Install Python and pip
RUN apk add --no-cache python3 py3-pip

# Install build dependencies for NumPy
RUN apk add --no-cache \
    build-base \
    gfortran \
    openblas-dev \
    libffi-dev \
    openssl-dev \
    python3-dev

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY neural.py .

# Set the default command to run when the container starts
CMD ["python3", "neural.py"]

