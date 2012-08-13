# -*- encoding: utf-8 -*-
#!/usr/bin/ruby

def print_test_count(testcase_regexp)
  author = `git config --get user.name`.strip
  since_commit = ARGV[0] || "master"
  git_log = "git log --author=#{author} --remove-empty --oneline --unified=0 --ignore-all-space #{since_commit}..HEAD"

  p git_log

  plus_grep = "#{git_log} | grep -E '^\\+#{testcase_regexp}' -c"
  minus_grep = "#{git_log} | grep -E '^-#{testcase_regexp}' -c"

  #p plus_grep
  #p minus_grep

  plus_count = `#{plus_grep}`.strip.to_i
  minus_count = `#{minus_grep}`.strip.to_i

  p "plus=#{plus_count}, minus=#{minus_count}, increment=#{plus_count - minus_count}"
end


