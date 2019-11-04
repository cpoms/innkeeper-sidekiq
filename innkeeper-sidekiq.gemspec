# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'innkeeper/sidekiq/version'

Gem::Specification.new do |spec|
  spec.name          = "innkeeper-sidekiq"
  spec.version       = Innkeeper::Sidekiq::VERSION
  spec.authors       = ["Mike Campbell"]
  spec.email         = ["mike@ydd.io"]
  spec.description   = %q{Enable Multi-tenant supported jobs to work with Sidekiq background worker}
  spec.summary       = %q{Sidekiq support for Innkeeper}
  spec.homepage      = "https://github.com/cpoms/innkeeper-sidekiq"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'

  spec.add_dependency 'innkeeper', '>= 1.0'
  spec.add_dependency 'sidekiq', '>= 2.11'
end
