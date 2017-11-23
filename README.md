# 🔐 SimpleEncryptor

> Simple, url-safe, opinionated string encryption

What if you need just an encrypted string in an URL-safe format? All these hard decisions and cryptography terminology, dubious snippets from StackOverflow, comprehensive all-in-one gems with hundreds algorithms and use-cases can be quite confusing and give unnecessary overhead.

`SimpleEncryptor` does exactly what it says on the tin — simply encrypts a string (symmetrically/asymmetrically, dependin on dynamic/static IV you provide) and returns it in URL-safe format you can use in your links if needed.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_encryptor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_encryptor

## Usage

```ruby
secret_key = 'foobarfoobarfoobarfoobarfoobarfo' # 32 byte string
iv         = 'foobarfoobarfoob'                 # 16 bit string (static/dynamic)

SimpleEncryptor.encrypt('Bond, James Bond', secret_key, iv)
# AES 256 CBC Openssl Encrypted String:
# => Zm9vYmFyZm9vYmFyZm9vYhwQbII-Col3sO7re1_ypzvtSRkDot6MH5oNr0Q5ql6S

SimpleEncryptor.decrypt(
  'Zm9vYmFyZm9vYmFyZm9vYhwQbII-Col3sO7re1_ypzvtSRkDot6MH5oNr0Q5ql6S', 
  secret_key
) # => 'Bond, James Bond'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/smileart/simple_encryptor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleEncryptor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/smilerart/simple_encryptor/blob/master/CODE_OF_CONDUCT.md).
