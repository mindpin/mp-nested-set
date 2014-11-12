# -*- coding: utf-8 -*-
ENV['RACK_ENV'] = 'test'
require "bundler"
require 'database_cleaner'
require "./lib/mp-nested-set"
Bundler.require(:test)



# RSpec.configure do |config|

#   config.before :each do
#     DatabaseCleaner[:mongoid].strategy = :truncation
#     DatabaseCleaner[:mongoid].start
#   end

#   config.after :each do
#     DatabaseCleaner[:mongoid].clean
#   end
# end
