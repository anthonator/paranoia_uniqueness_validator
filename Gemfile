source 'https://rubygems.org'

# Specify your gem's dependencies in paranoia_uniqueness_validator.gemspec
gemspec

rails_version = ENV['RAILS_VERSION'] || 'default'

rails = case rails_version

when 'master'
  { github: 'rails/rails' }
when 'default'
  '>= 5.1.0'
else
  "~> #{rails_version}"
end

gem 'rails', rails

platforms :jruby do
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
end

platforms :ruby do
  gem "sqlite3"
  gem "test-unit"
end

group :development do
  gem 'bundler'
  gem 'coveralls', :require => false
  gem 'listen'
  gem 'rake'
end
