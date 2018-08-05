#!/bin/bash

readonly ROOT_DIR="$( cd "$( dirname "${0}" )" && cd .. && pwd )"
source ${ROOT_DIR}/.env

docker build \
  --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
  --build-arg QUESTION_BOOK_HOME=${QUESTION_BOOK_HOME} \
  --tag ${QUESTION_BOOK_IMAGE} \
    ${ROOT_DIR}/app
