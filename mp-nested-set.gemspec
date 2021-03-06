# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mp_nested_set/version'

Gem::Specification.new do |spec|
  spec.name          = "mp-nested-set"
  spec.version       = MpNestedSet::VERSION
  spec.authors       = ["arlyxiao"]
  spec.email         = ["kingla_pei@163.com"]
  spec.summary       = %q{Nested tree extended from mongoid_nested_set}
  spec.description   = %q{Nested tree extended from mongoid_nested_set}
  spec.homepage      = "https://github.com/mindpin/mp-nested-set"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "database_cleaner", "~> 1.2.0"

  # spec.add_dependency "mongoid"
  # spec.add_development_dependency "rspec-rails"
  spec.add_runtime_dependency "glebtv-mongoid_nested_set", '~> 0.4.2'
end
