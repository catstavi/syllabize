# Syllabize

Syllabize is a simple syllable counter written in Ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'syllabize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install syllabize

## Usage

First, require `syllabize`. Then, you can call the `count_vowels` method on a string.

```ruby
Syllabize::Counter.new('Ruby').count_syllables
# => 4
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tests and run them (`rake` or `rspec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
