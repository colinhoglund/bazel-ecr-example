#!/bin/sh

echo "STABLE_DOCKER_REGISTRY ${DOCKER_REGISTRY}"
echo "RANDOM_HASH $(date | md5sum | awk '{print $1}')"
