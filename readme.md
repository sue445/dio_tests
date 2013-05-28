# DIO Tests [![Build Status](https://travis-ci.org/sue445/dio_tests.png?branch=master)](https://travis-ci.org/sue445/dio_tests)

![お前は今まで書いたテストの個数を覚えているのか？](https://raw.github.com/sue445/dio_tests/master/img/dio.png)


## Overview
count test on your git log

    $ dio_tests rspec
    git log --author=sue445 --remove-empty --oneline --unified=0 --ignore-all-space master..HEAD
    plus=2, minus=0, increment=2

## Installation

Add this line to your application's Gemfile:

    gem 'dio_tests'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dio_tests

## Usage

```sh
Usage: dio <format_type> [options]
    format_type                      test format(ex. rspec, junit4, qunit)
    -s, --since=SINCE_COMMIT         git log <SINCE_COMMIT>...HEAD (default: master)
    -a, --author=AUTHOR_NAME         git log --author=<AUTHOR_NAME> (default: use 'user.name' in .gitconfig)
```

## Supported
* Ruby
 * RSpec
* Java
 * JUnit4
* JavaScript
 * QUnit

## Required
* ruby
* git

[![endorse](http://api.coderwall.com/sue445/endorsecount.png)](http://coderwall.com/sue445)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
