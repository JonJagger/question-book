FROM  cyberdojo/sinatra
LABEL maintainer=jon@jaggersoft.com

RUN apk update
RUN apk upgrade

COPY Gemfile .
#COPY Gemfile.lock .
RUN gem install bundler
RUN bundle install

COPY . /app

ARG PORT
EXPOSE ${PORT}
ENV PORT=${PORT}

CMD [ "./up.sh" ]
