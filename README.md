# ParanoiaUniquenessValidator [![endorse](http://api.coderwall.com/anthonator/endorsecount.png)](http://coderwall.com/anthonator)

Adds validator validates_uniqueness_without_deleted.

This validator will ignore any record that has a non-null value for the deleted_at field. This gem was made specifically for use with the [Paranoia](https://github.com/radar/paranoia) gem but it can be used with any gem that uses the deleted_at field for marking records as deleted.

[![Build Status](https://secure.travis-ci.org/anthonator/paranoia_uniqueness_validator.png)](http://travis-ci.org/anthonator/paranoia_uniqueness_validator) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/anthonator/paranoia_uniqueness_validator)

## Installation

Add this line to your application's Gemfile:

    gem 'paranoia_uniqueness_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paranoia_uniqueness_validator

## Usage

```ruby

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
