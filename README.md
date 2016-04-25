# Rack::Skippable [![Build Status](https://travis-ci.org/sunaot/rack-skippable.svg?branch=master)](https://travis-ci.org/sunaot/rack-skippable)

Rack::Skippable helps your Rack application to avoid running app logic (app#call) in some conditions.

## Usage

```ruby
skip_when = ->(env) {
  request = Rack::Request.new(env)
  return request.path == '/img'
}
use Rack::Skippable.wrap(Rack::Auth::Basic, skip_when) do |u, p|
  expected = [ENV['NAME'], ENV['PASSWORD']]
  expected == [u, p]
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-skippable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-skippable

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sunaot/rack-skippable.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

