# お前は今まで書いたテストの個数を覚えているのか？

自分のコミットログからテストを数えます

    $ ruby dio_tests/rspec.rb master
    "git log --author=sue445 --remove-empty --oneline --unified=0 --ignore-all-space master..HEAD"
    "plus=2, minus=0, increment=2"

## required
* ruby
* git
* grep
