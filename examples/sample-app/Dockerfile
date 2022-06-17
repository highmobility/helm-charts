FROM ruby:3.1-alpine

WORKDIR /app

COPY src/Gemfile /app/Gemfile
COPY src/Gemfile.lock /app/Gemfile.lock

RUN bundle install
COPY src /app

EXPOSE 9292

ENTRYPOINT /bin/sh
CMD /app/web.sh