#!/bin/bash -e

ruby -r erb -e 'puts ERB.new(File.read("/etc/nginx/default.conf.erb")).result' > /etc/nginx/sites-enabled/default.conf
ruby -r erb -e 'puts ERB.new(File.read("/etc/nginx/passenger.conf.erb")).result' > /etc/nginx/passenger.conf

rails assets:precompile

rake db:exists && rake db:migrate || rake db:setup

nginx
