#!/bin/bash

if [[ "${{ github.ref }}" == "refs/heads/main" || "${{ github.event_name }}" == "pull_request" ]]; then
    docker $1 -t ${{ vars.DOCKERHUB_USERNAME }}/iphone-shop-app:latest .
else
    docker $1 -t ${{ vars.DOCKERHUB_USERNAME }}/iphone-shop-app:$2 .
fi   