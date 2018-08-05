#!/bin/bash

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/../.env

docker rm --force ${QUESTION_BOOK_CONTAINER} &> /dev/null || true
