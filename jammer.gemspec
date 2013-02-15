# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jammer/version'

Gem::Specification.new do |gem|
  gem.name          = 'jammer'
  gem.authors       = ["Colin Rymer"]
  gem.email         = ["colin.rymer@gmail.com"]
  gem.description   = 'Create, publish, and maintain jam packages.'
  gem.summary       = 'Create, publish, and maintain jam packages.'
  gem.homepage      = "http://github.com/primedia/jammer"
  gem.license       = 'MIT'
  gem.requirements  = 'Jam, the JS package manager available via NPM'
  gem.files         = Dir.glob("{bin,lib,features,spec}/**/*") + %w(LICENSE README.md)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

  gem.require_paths = ["lib"]

  gem.version       = Jammer::VERSION

  gem.required_ruby_version = '>= 1.9'

  gem.add_dependency 'methadone', '~> 1.2.4'
  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency 'simplecov'
end

