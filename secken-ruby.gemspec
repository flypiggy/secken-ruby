# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secken/version'

Gem::Specification.new do |spec|
  spec.name          = "secken-ruby"
  spec.version       = Secken::VERSION
  spec.authors       = ["Gavin"]
  spec.email         = ["gavin.li1986@gmail.com"]

  spec.summary       = %q{Unofficial ruby sdk for secken}
  spec.description   = %q{You can view more details from https://www.yangcong.com/developer}
  spec.homepage      = "https://github.com/flypiggy/secken-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.8"
end
