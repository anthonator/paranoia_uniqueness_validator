ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

$:.unshift File.expand_path('../../../lib', __FILE__)
