# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'casica/version'

Gem::Specification.new do |spec|
  spec.name          = "casica"
  spec.version       = Casica::VERSION
  spec.authors       = ["Yuta Igarashi"]
  spec.email         = ["y.iga.thunder@gmail.com"]

  spec.summary       = %q{Casica API Ruby Wrapper}
  spec.description   = %q{Casica API Ruby Wrapper}
  spec.homepage      = "https://github.com/startup-technology/casica-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.9"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
