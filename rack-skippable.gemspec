# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/skippable/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-skippable"
  spec.version       = Rack::Skippable::VERSION
  spec.authors       = ["sunaot"]
  spec.email         = ["sunao.tanabe@gmail.com"]

  spec.summary       = %q{Rack::Skippable helps your Rack application to avoid running app logic (app#call) in some conditions.}
  spec.description   = %q{Rack::Skippable helps your Rack application to avoid running app logic (app#call) in some conditions.}
  spec.homepage      = "https://github.com/sunaot/rack-skippable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
