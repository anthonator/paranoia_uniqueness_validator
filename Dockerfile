FROM ruby:2.3

MAINTAINER Anthony Smith <anthony@sticksnleaves.com>

ENV APP_HOME /usr/src/app

RUN apt-get update -y \
    && apt-get upgrade -y

RUN gem install rubygems-update --no-document
RUN gem install bundler --no-document

WORKDIR $APP_HOME
