#!/bin/bash

bundle exec rackup \
  --warn \
  --host 0.0.0.0 \
  --port ${QUESTION_BOOK_PORT} \
  --server thin \
  --env production \
    config.ru

