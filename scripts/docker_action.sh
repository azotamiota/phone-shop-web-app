#!/bin/bash

if [[ "$3" == "refs/heads/main" || "$4" == "pull_request" ]]; then
    docker $1 -t ${{ vars.DOCKERHUB_USERNAME }}/iphone-shop-app:latest .
else
    docker $1 -t ${{ vars.DOCKERHUB_USERNAME }}/iphone-shop-app:$2 .
fi   