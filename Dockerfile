# Stage 1: Build Stage
FROM python:3.9 AS build-stage

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to optimize caching
COPY requirements.txt .

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Production Stage
FROM python:3.9-slim AS production-stage

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files from the build-stage
COPY --from=build-stage /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY --from=build-stage /usr/local/bin/ /usr/local/bin/

# Copy the code files and pickle files from the cloned repository
COPY app.py .
COPY tfidf_remitter_name_m3.pkl .
COPY tfidf_source_m3.pkl .
COPY tfidf_base_txn_text_m3.pkl .
COPY tfidf_mode_m3.pkl .
COPY tfidf_benef_name_m3.pkl .
COPY classifier_m3.pkl .

# Expose the port on which the Flask app will run
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
