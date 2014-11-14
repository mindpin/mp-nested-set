# -*- coding: utf-8 -*-
ENV['RACK_ENV'] = 'test'
require "bundler"
require 'database_cleaner'
require './lib/mp-nested-set'


Mongoid.load!(File.expand_path("../mongoid.yml",__FILE__))
Bundler.require(:default, :test)



RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].start
  end

  config.after :each do
    DatabaseCleaner[:mongoid].clean
  end
end
