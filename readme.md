![お前は今まで書いたテストの個数を覚えているのか？](https://raw.github.com/sue445/dio_tests/master/img/dio.png)

自分のコミットログからテストを数えます

    $ ruby dio_tests/rspec.rb master
    git log --author=sue445 --remove-empty --oneline --unified=0 --ignore-all-space master..HEAD
    plus=2, minus=0, increment=2

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
