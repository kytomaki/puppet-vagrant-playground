#!/bin/sh
bundle install --path vendor/bundle
bundle exec librarian-puppet install --verbose --clean --path=puppet/modules --puppetfile=Puppetfile
