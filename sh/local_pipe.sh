#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/../.env
readonly PORT=${1:-${QUESTION_BOOK_PORT}}

${MY_DIR}/build.sh
${MY_DIR}/down.sh
${MY_DIR}/up.sh ${PORT}
${MY_DIR}/test.sh
echo "Up on port ${PORT}"