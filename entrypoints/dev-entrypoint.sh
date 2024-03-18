#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rake db:setup db:migrate
bundle exec rails s -b 0.0.0.0
bun exec ./bin/dev
bundle exec sleep 1d

