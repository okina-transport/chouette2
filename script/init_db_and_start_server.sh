#!/usr/bin/env bash

RAILS_ENV=production bundle exec rake db:gis:setup
RAILS_ENV=production bundle exec rake db:migrate

RAILS_ENV=production bundle exec rake jobs:work

RAILS_ENV=production bundle exec rails server
