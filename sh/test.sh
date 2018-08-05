#!/bin/bash

readonly ROOT_DIR="$( cd "$( dirname "${0}" )" && cd .. && pwd )"
source ${ROOT_DIR}/.env

if docker exec ${QUESTION_BOOK_CONTAINER} sh -c 'rake test'; then
  echo "Test run PASSED"
else
  echo "Test run FAILED"
  #docker logs ${FACES_BOOK_CONTAINER}
  exit 1
fi
