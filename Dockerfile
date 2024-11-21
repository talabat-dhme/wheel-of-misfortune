# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the current directory to the working directory in the container
COPY . /app

# Expose the port to access the HTTP server
EXPOSE 8000

# Define the command to start the HTTP server
CMD ["python3", "-m", "http.server", "8000"]
