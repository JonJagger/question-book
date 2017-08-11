#!/bin/bash

if [ "${TRAVIS_PULL_REQUEST}" == "false" ]; then
  BRANCH=${TRAVIS_BRANCH}
else
  BRANCH=${TRAVIS_PULL_REQUEST_BRANCH}
fi

if [ "${BRANCH}" == "master" ]; then
  docker login --username "${DOCKERHUB_USERNAME}" --password "${DOCKERHUB_PASSWORD}"
  TAG_NAME=$(basename ${TRAVIS_REPO_SLUG})
  docker push cyberdojo/${TAG_NAME}
  echo "PUSHED cyberdojo/${TAG_NAME} to dockerhub"
fi