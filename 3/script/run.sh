#!/bin/bash -e

ruby -r erb -e 'puts ERB.new(File.read("/etc/nginx/default.conf.erb")).result' > /etc/nginx/sites-enabled/default.conf
ruby -r erb -e 'puts ERB.new(File.read("/etc/nginx/passenger.conf.erb")).result' > /etc/nginx/passenger.conf

# Install yarn and compile webpack assets
bundle exec rails webpacker:install
bundle exec rails webpacker:compile

# Compile assets in rails pipeline
rails assets:precompile

# Check for database and migrate or setup the database
rake db:exists && rake db:migrate || rake db:setup

nginx
