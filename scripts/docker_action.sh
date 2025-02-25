#!/bin/bash

# Arguments:
# $1: Docker command (e.g., "build")
# $2: Commit SHA (e.g., "abc123")
# $3: Git ref (e.g., "refs/heads/main")
# $4: Event name (e.g., "push" or "pull_request")
# $5: Docker Hub username (e.g., "myusername")

if [[ "$3" == "refs/heads/main" || "$4" == "pull_request" ]]; then
  if [[ "$1" == "build" ]]; then
    docker build -t "$5/iphone-shop-app:latest" .
  elif [[ "$1" == "push" ]]; then
    docker push "$5/iphone-shop-app:latest"
  fi
elif [[ "$1" == "build" ]]; then
    docker build -t "$5/iphone-shop-app:$2" .
elif [[ "$1" == "push" ]]; then
    docker push "$5/iphone-shop-app:$2" .
fi
