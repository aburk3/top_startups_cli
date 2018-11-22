# TopStartups

This gem "top-startups" scrapes the web-page "https://www.startupranking.com/top" for the top 5 current startups. Upon running, the CLI (command line interface) will ask the user to select a number from a list of 5 startups. Further details will be presented based on the selected startup.

The details presented include: name, location(country), rank, SR score, and funding. SR Score explained here: https://www.startupranking.com/how-it-works#sr_score

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'top_startups'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install top_startups

## Usage

To run this gem, you can type into the terminal/command prompt:

  `ruby bin/top-startups`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aburk3/top_startups.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
