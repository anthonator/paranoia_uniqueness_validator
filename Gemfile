source 'https://rubygems.org'

# Specify your gem's dependencies in paranoia_uniqueness_validator.gemspec
gemspec

platforms :jruby do
  gem "activerecord-jdbcsqlite3-adapter", :git => "git://github.com/jruby/activerecord-jdbc-adapter.git"
  gem "jruby-openssl"
end

platforms :ruby do
  gem "sqlite3"
end
