# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jammer/version', __FILE__)
require 'date'

Gem::Specification.new do |gem|
  gem.authors       = ["Colin Rymer"]
  gem.email         = ["colin.rymer@gmail.com"]
  gem.description   = 'Create, publish, and maintain jam packages.'
  gem.summary       = 'Create, publish, and maintain jam packages.'
  gem.homepage      = "http://github.com/primedia/jammer"
  gem.license       = 'MIT'
  gem.executables   = []
  gem.files         = Dir['Rakefile', '{bin,lib,man,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  gem.test_files    = `git ls-files -- spec/*`.split("\n")
  gem.name          = 'jammer'
  gem.require_paths = ["lib"]
  gem.version       = Jammer::VERSION
  gem.required_ruby_version = '>= 1.9'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-cucumber'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'rb-inotify'
end

