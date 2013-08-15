# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fluxr/version'

Gem::Specification.new do |spec|
  spec.name          = "fluxr"
  spec.version       = Fluxr::VERSION
  spec.authors       = ["agupta666"]
  spec.email         = ["agupta666@gmail.com"]
  spec.description   = %q{Has enormous potential to be useful}
  spec.summary       = %q{javascriptish gibberish}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('haml')
  spec.add_dependency('sinatra')
  spec.add_dependency('redcarpet')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
