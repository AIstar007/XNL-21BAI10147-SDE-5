#!/bin/bash

# Set variables
APP_NAME="fintech-app"
VERSION="v1.0.0"
DOCKER_IMAGE="your-dockerhub-username/$APP_NAME:$VERSION"
AWS_ECS_CLUSTER="fintech-cluster"
AWS_ECS_SERVICE="fintech-service"
GCP_PROJECT="your-gcp-project"
GCP_REGION="us-central1"

echo "[INFO] Building Docker image..."
docker build -t $DOCKER_IMAGE .

echo "[INFO] Pushing Docker image to registry..."
docker push $DOCKER_IMAGE

echo "[INFO] Deploying to AWS ECS..."
aws ecs update-service --cluster $AWS_ECS_CLUSTER --service $AWS_ECS_SERVICE --force-new-deployment

echo "[INFO] Deploying to GCP Cloud Run..."
gcloud run deploy $APP_NAME --image $DOCKER_IMAGE --region $GCP_REGION --platform managed --project $GCP_PROJECT

echo "[SUCCESS] Deployment completed!"
