FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV HOME="/app"

WORKDIR $HOME

COPY Gemfile $HOME/Gemfile
COPY Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update && \
    bundle install

ADD . $HOME

CMD ["rails", "server", "-b", "0.0.0.0"]