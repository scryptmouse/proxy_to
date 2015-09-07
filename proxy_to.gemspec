# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxy_to/version'

Gem::Specification.new do |spec|
  spec.name          = "proxy_to"
  spec.version       = ProxyTo::VERSION
  spec.authors       = ["Alexa Grey"]
  spec.email         = ["devel@mouse.vc"]

  spec.summary       = %q{Very Simple Object Proxying -- with no dependencies.}
  spec.description   = %q{Very Simple Object Proxying -- with no dependencies.}
  spec.homepage      = "https://github.com/scryptmouse/proxy_to"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
