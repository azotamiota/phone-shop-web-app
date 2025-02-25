#!/bin/bash

# Arguments:
# $1: Docker command (e.g., "build")
# $2: Commit SHA (e.g., "abc123")
# $3: Git ref (e.g., "refs/heads/main")
# $4: Event name (e.g., "push" or "pull_request")
# $5: Docker Hub username (e.g., "myusername")

if [[ "$3" == "refs/heads/main" || "$4" == "pull_request" ]]; then
    docker $1 -t "$5/iphone-shop-app:latest" .
else
    docker $1 -t "$5/iphone-shop-app:$2" .
fi   