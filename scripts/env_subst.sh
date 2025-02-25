#!/bin/bash

export $(cat .env | xargs)
envsubst < postgres-pod-template.yaml > postgres-pod.yaml