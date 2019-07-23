FROM ubuntu:18.04

ENV APP_DIR=/app \
  GEM_HOME=/usr/local/lib/ruby/2.5.1 \
  NGINX_VERSION=1.15.12 \
  PATH="${PATH}:/usr/local/lib/ruby/2.5.1/bin" \
  PASSENGER_VERSION=6.0.2 \
  RAILS_ENV=production \
  RUBY_VERSION=2.5.1

COPY script/* /usr/local/bin/
RUN setup

COPY nginx/* /etc/nginx/

RUN mkdir $APP_DIR
WORKDIR $APP_DIR

ONBUILD COPY Gemfile* ./
ONBUILD COPY ./vendor ./vendor
ONBUILD RUN gem install bundler && bundle install
ONBUILD COPY . ./
