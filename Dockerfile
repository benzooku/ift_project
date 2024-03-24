FROM ruby:3.3.0

RUN apt-get update && apt-get install -y \
      nodejs \
      yarn

WORKDIR /app

COPY Gemfile ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

COPY package.json yarn.lock ./

COPY . ./

