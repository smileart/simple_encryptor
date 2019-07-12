# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_encryptor'

Gem::Specification.new do |spec|
  spec.name          = 'simple_encryptor'
  spec.version       = SimpleEncryptor::VERSION
  spec.authors       = ['smileart']
  spec.email         = ['smileart21@gmail.com']

  spec.summary       = 'Simple, url-safe, opinionated string encryption'
  spec.description   = 'Simple, url-safe, opinionated string encryption'
  spec.homepage      = 'http://github.com/smileart/simple_encryptor'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',        '~> 2.0'
  spec.add_development_dependency 'byebug',         '~> 11.0'
  spec.add_development_dependency 'inch',           '>= 0.9.0.rc1'
  spec.add_development_dependency 'letters',        '~> 0.4'
  spec.add_development_dependency 'rack',           '~> 2.0'
  spec.add_development_dependency 'rake',           '~> 12.2'
  spec.add_development_dependency 'rspec',          '~> 3.7'
  spec.add_development_dependency 'rubocop',        '~> 0.51'
  spec.add_development_dependency 'rubygems-tasks', '~> 0.2'
  spec.add_development_dependency 'simplecov',      '~> 0.15'
  spec.add_development_dependency 'yard',           '~> 0.9'
end
