# Use an official Python runtime as a parent image
FROM python:3.9-slim
# Set the working directory in the container
WORKDIR /app
# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
# Clone the repository
RUN git clone https://github.com/nyrahul/wisecow.git
# Change the working directory to the cloned repository
WORKDIR /app/wisecow
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Expose the port the application runs on (adjust if different)
EXPOSE 5000
# Define environment variable 
ENV FLASK_APP=app.py 
# Run app.py when the container launches 
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
