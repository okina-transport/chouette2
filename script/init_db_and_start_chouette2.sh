#!/usr/bin/env bash

RAILS_ENV=production bundle exec rake db:gis:setup
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:clobber assets:precompile
RAILS_ENV=production bundle exec rails server -b 0.0.0.0

