source 'https://rubygems.org'

# Specify your gem's dependencies in paranoia_uniqueness_validator.gemspec
gemspec

platforms :jruby do
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
end

platforms :ruby do
  gem "sqlite3"
  gem "test-unit"
end

platforms :rbx do
  #gem 'psych'
  #gem 'racc'
  #gem 'rubinius-coverage'
  #gem 'rubysl'
  #gem 'rubysl-test-unit'
end

group :development do
  gem 'bundler'
  gem 'coveralls', :require => false
  gem 'rake'
end
