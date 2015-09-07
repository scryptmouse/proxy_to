# ProxyTo [![Build Status](https://travis-ci.org/scryptmouse/proxy_to.svg?branch=master)](https://travis-ci.org/scryptmouse/proxy_to)

Dead-simple proxying to another object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proxy_to'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxy_to

## Usage

```ruby
class Foo
  attr_reader :bar

  def initialize
    @bar = "desired output"
  end
end

class FooWrapper
  attr_reader :wrapped
  proxy_to :wrapped

  def initialize(wrapped = Foo.new)
    @wrapped = wrapped
  end
end

wrapper = FooWrapper.new

wrapper.bar

# => "desired output"
```

It also works well with singleton / class methods.

```ruby
class Configuration
  include Singleton

  proxy_to :instance

  def samophlange?
  end
end

Configuration.respond_to? :samophlange?
# => true
```

## Development

Run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/github/proxy_to. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
