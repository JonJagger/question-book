#!/bin/bash

readonly ROOT_DIR="$( cd "$( dirname "${0}" )" && cd .. && pwd )"
source ${ROOT_DIR}/.env

docker rm --force ${QUESTION_BOOK_CONTAINER} &> /dev/null || true
