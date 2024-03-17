FROM ruby:3.3.0

ENV BUNDLER_VERSION=2.4.18

RUN apt-get update && apt-get install -y \
      nodejs \
      yarn

RUN gem install bundler -v 2.4.18

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

COPY package.json yarn.lock ./

COPY . ./
