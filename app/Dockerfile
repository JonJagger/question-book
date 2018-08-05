ARG   ALPINE_VERSION
FROM  alpine:${ALPINE_VERSION}
LABEL maintainer=jon@jaggersoft.com

RUN apk --update --no-cache add \
    bash \
    ruby-bundler \
    ruby-dev

ARG  QUESTION_BOOK_HOME
COPY Gemfile ${QUESTION_BOOK_HOME}/
WORKDIR ${QUESTION_BOOK_HOME}

RUN apk --update add --virtual build-dependencies build-base \
  && bundle config --global silence_root_warning 1 \
  && bundle install \
  && gem clean \
  && apk del build-dependencies build-base \
  && rm -vrf /var/cache/apk/*

COPY . ${QUESTION_BOOK_HOME}

CMD [ "./question-book.sh" ]
