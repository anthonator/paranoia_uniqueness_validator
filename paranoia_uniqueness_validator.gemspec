# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paranoia_uniqueness_validator/version'

Gem::Specification.new do |gem|
  gem.name          = "paranoia_uniqueness_validator"
  gem.version       = ParanoiaUniquenessValidator::VERSION
  gem.authors       = ["Anthony Smith"]
  gem.email         = ["anthony@sticksnleaves.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
