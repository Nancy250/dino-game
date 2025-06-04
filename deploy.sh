#!/bin/bash
set -e

echo "Starting deployment..."

cd ~/react-app || exit 1

echo "Stopping existing container..."
docker stop react-container || true

echo "Removing existing container..."
docker rm react-container || true

echo "Building Docker image..."
docker build -t react-app .

echo "Running Docker container..."
docker run -d -p 80:3000 --name react-container react-app

echo "Deployment completed successfully!"
