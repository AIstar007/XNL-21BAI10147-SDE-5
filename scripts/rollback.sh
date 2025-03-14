#!/bin/bash

# Set rollback variables
APP_NAME="fintech-app"
LAST_STABLE_VERSION="v0.9.0"
DOCKER_IMAGE="your-dockerhub-username/$APP_NAME:$LAST_STABLE_VERSION"
AWS_ECS_CLUSTER="fintech-cluster"
AWS_ECS_SERVICE="fintech-service"
GCP_PROJECT="your-gcp-project"
GCP_REGION="us-central1"

echo "[ALERT] Rollback triggered! Restoring last stable version..."

echo "[INFO] Deploying last stable version to AWS ECS..."
aws ecs update-service --cluster $AWS_ECS_CLUSTER --service $AWS_ECS_SERVICE --force-new-deployment

echo "[INFO] Deploying last stable version to GCP Cloud Run..."
gcloud run deploy $APP_NAME --image $DOCKER_IMAGE --region $GCP_REGION --platform managed --project $GCP_PROJECT

echo "[SUCCESS] Rollback completed. Service restored to $LAST_STABLE_VERSION"
