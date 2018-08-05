#!/bin/bash
set -e

readonly ROOT_DIR="$( cd "$( dirname "${0}" )" && cd .. && pwd )"
source ${ROOT_DIR}/.env
readonly PORT=${1:-${QUESTION_BOOK_PORT}}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

wait_till_up() # $1==container_name
{
  local n=10
  while [ $(( n -= 1 )) -ge 0 ]
  do
    if docker ps --filter status=running --format '{{.Names}}' | grep -q ^${1}$ ; then
      return
    else
      sleep 0.2
    fi
  done
  echo "${1} not up after 2 seconds"
  docker logs "${1}"
  exit 1
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

docker run \
  --rm \
  --detach \
  --name ${QUESTION_BOOK_CONTAINER} \
  --publish ${PORT}:${PORT} \
  --env QUESTION_BOOK_PORT=${PORT} \
  ${QUESTION_BOOK_IMAGE} \
    sh -c "./question-book.sh"

wait_till_up ${QUESTION_BOOK_CONTAINER}
