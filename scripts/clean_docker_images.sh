#!/bin/bash

# Set the age threshold
AGE_THRESHOLD="30 days ago"

# Get the image IDs older than the threshold
docker images --format "{{.ID}} {{.CreatedAt}}" | while read -r line; do
  IMAGE_ID=$(echo $line | awk '{print $1}')
  CREATED_AT=$(echo $line | awk '{print $2, $3, $4}')
  
  if [[ $(date -d "$CREATED_AT" +%s) -lt $(date -d "$AGE_THRESHOLD" +%s) ]]; then
    echo "Deleting image ID: $IMAGE_ID created on: $CREATED_AT"
    docker rmi -f $IMAGE_ID
  fi
done
