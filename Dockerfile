FROM ruby:3.3.0

RUN apt-get update && apt-get install -y \
      nodejs \
      watchman \
      yarn

RUN wget 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
ENV PATH=$PATH:/squashfs-root/usr/bin 

WORKDIR /app

COPY Gemfile ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

COPY package.json yarn.lock ./

COPY . ./

