# Constantin
A handy way to manage constants especially for options.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'constantin'
```

And then execute:

    $ bundle

## Usage

```ruby
# app/constants/country.rb
class Country < Constantin::Option
  define_options 'US', 'PH', 'JP'
  define_options { NZ: "New Zealand"}
end

Country::ALL
=> ['US', 'PH', 'JP', 'New Zealand']

Country.constants
=> [:US, :PH, :JP, :NZ]

Country::US
=> 'US'
```

Validate field in model against constants
```ruby 
class User
  has_options :country, field: address
end

user = User.new
user.address = "US"
user.valid?
=> true

user.address = "NZ"
user.valid?
=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/constantin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Constantin project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/constantin/blob/master/CODE_OF_CONDUCT.md).
