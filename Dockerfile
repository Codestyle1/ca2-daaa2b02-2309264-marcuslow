# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container (inside the application folder)
WORKDIR /ca2-daaa2b02-2309264-marcuslow/application

# Copy only the necessary files (requirements.txt first, then the rest)
COPY requirements.txt /ca2-daaa2b02-2309264-marcuslow/
COPY . /ca2-daaa2b02-2309264-marcuslow/

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r /ca2-daaa2b02-2309264-marcuslow/requirements.txt

# Expose port 5000 for Flask app
EXPOSE 5000

# Set environment variables for Flask
ENV FLASK_APP=/ca2-daaa2b02-2309264-marcuslow/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development  

# Run the Flask app
CMD ["flask", "run"]
