# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paranoia_uniqueness_validator/version'

Gem::Specification.new do |gem|
  gem.name          = "paranoia_uniqueness_validator"
  gem.version       = ParanoiaUniquenessValidator::VERSION
  gem.licenses      = ['MIT']
  gem.authors       = ["Anthony Smith"]
  gem.email         = ["anthony@sticksnleaves.com"]
  gem.description   = %q{Adds the validates_uniqueness_without_deleted validator to ignore deleted fields when validating for uniqueness.}
  gem.summary       = %q{Validate unique fields without letting those pesky deleted records get in the way. Great for use with Paranoia.}
  gem.homepage      = "https://github.com/anthonator/paranoia_uniqueness_validator"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", ">= 5.2.0", "< 7.1"

  gem.add_development_dependency "paranoia", "~> 2.3"
  gem.add_development_dependency "database_cleaner", "~> 2.0"
  gem.add_development_dependency "rspec-rails", "~> 6.0"
end
