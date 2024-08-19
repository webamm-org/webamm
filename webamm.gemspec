# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webamm/version'

Gem::Specification.new do |spec|
  spec.name          = 'webamm'
  spec.authors       = ['Paweł Dąbrowski']
  spec.email         = ['contact@paweldabrowski.com']
  spec.license       = 'MIT'
  spec.version       = Webamm::VERSION.dup
  spec.summary       = 'Web Application Metadata Markup'
  spec.description   = spec.summary
  spec.files         = Dir['README.md', 'webamm.gemspec', 'lib/**/*']
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'dry-struct', '1.6.0'
  spec.required_ruby_version = '>= 3.2.2'
end
