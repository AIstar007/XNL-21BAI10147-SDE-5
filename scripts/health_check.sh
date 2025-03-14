#!/bin/bash

SERVICE_URL="https://your-service-url.com/health"
MAX_RETRIES=3
RETRY_DELAY=10
FAIL_COUNT=0

echo "[INFO] Running health check for $SERVICE_URL"

for ((i=1; i<=MAX_RETRIES; i++)); do
  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $SERVICE_URL)
  
  if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "[SUCCESS] Health check passed! Service is running fine."
    exit 0
  else
    echo "[WARNING] Health check failed (Attempt $i/$MAX_RETRIES). Status Code: $HTTP_STATUS"
    ((FAIL_COUNT++))
    sleep $RETRY_DELAY
  fi
done

if [ "$FAIL_COUNT" -ge "$MAX_RETRIES" ]; then
  echo "[ALERT] Service is unhealthy! Initiating rollback..."
  bash rollback.sh
fi
