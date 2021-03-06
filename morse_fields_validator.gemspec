# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'morse_fields_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "morse_fields_validator"
  spec.version       = MorseFieldsValidator::VERSION
  spec.authors       = ["Terry S","Fred McGroarty"]
  spec.email         = ["itsterry@gmail.com",""]

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Addes functions to validate fields in Databases using ActiveRecord}
  spec.homepage      = "https://github.com/morsedigital/morse_fields_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency "activemodel","~>4.2"
  # spec.add_dependency "activesupport","~>4.2"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "guard-rspec", "~> 4.5"
  spec.add_development_dependency "rb-fsevent", "~> 0.9"
  spec.add_development_dependency "shoulda-matchers", "~> 2.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
