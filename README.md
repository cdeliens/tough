[![Code Climate](https://codeclimate.com/github/cdeliens/tough/badges/gpa.svg)](https://codeclimate.com/github/cdeliens/tough)
[![Test Coverage](https://codeclimate.com/github/cdeliens/tough/badges/coverage.svg)](https://codeclimate.com/github/cdeliens/tough/coverage)
[![Issue Count](https://codeclimate.com/github/cdeliens/tough/badges/issue_count.svg)](https://codeclimate.com/github/cdeliens/tough)
# Tough

Be sure to have TOUGH Passwords in your Rails application with this gem. Based on ZXCVBN library to validate passwords strength, also some normal validators for special characters, capital letters and lowercase letters, minimum characters length.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tough'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tough

## Usage

`config/initializers/tough.rb
 Tough.configuration do |config|
  config.zxcvbn_minimum_score_to_pass = 3
  config.zxcvbn_error_message = "is too easy to guess"
  config.special_characters_error_message = "must contain special characters"
  config.minimum_characters = 8
  config.minimum_characters_error_message = "must be a minimum of #{Tough.minimum_characters} characters long"
  config.capitals_lowercase_error_message = "must have lowercase and uppercase letters"
 end
`
`
 class User < ActiveRecord::Base
   validates_by_zxcvbn_metric :password
   validates_capitals_and_lowercase_for :password
   validates_minimum_characters_for :password
   validates_special_characters_for :password
 end
`
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tough. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
