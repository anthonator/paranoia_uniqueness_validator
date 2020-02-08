# ParanoiaUniquenessValidator

Adds `validates_uniqueness_without_deleted`.

This validator will ignore any record that has a non-null value for the
`deleted_at` field. This gem was made specifically for use with the
[Paranoia](https://github.com/radar/paranoia) gem but it can be used with any
gem that uses the `deleted_at` field for marking records as deleted.

[![Gem Version](https://badge.fury.io/rb/paranoia_uniqueness_validator.png)](http://badge.fury.io/rb/paranoia_uniqueness_validator) ![ci](https://github.com/anthonator/paranoia_uniqueness_validator/workflows/ci/badge.svg) [![Coverage Status](https://coveralls.io/repos/anthonator/paranoia_uniqueness_validator/badge.png)](https://coveralls.io/r/anthonator/paranoia_uniqueness_validator) [![Code Climate](https://codeclimate.com/github/anthonator/paranoia_uniqueness_validator.png)](https://codeclimate.com/github/anthonator/paranoia_uniqueness_validator)

## Installation

Add this line to your application's Gemfile:

    # Rails 3
    gem 'paranoia_uniqueness_validator', '0.1.0'

    # Rails 4
    gem 'paranoia_uniqueness_validator', '1.1.0'

    # Rails 5.0
    gem 'paranoia_uniqueness_validator', '2.0.0'

    # Rails 5.1
    gem 'paranoia_uniqueness_validator', '3.1.0'

    # Rails 6
    gem 'paranoia_uniqueness_validator', '3.2.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paranoia_uniqueness_validator

## Configuration

This validator supports all configuration options used by the base ActiveRecord
uniqueness validator. For more information check out the [Rails API documentation](http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#method-i-validates_uniqueness_of).

## Usage

```ruby
class SomeModel < ActiveRecord::Base
  validates :some_field, uniqueness_without_deleted: true
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
