#!/usr/bin/ruby

testcase_regexp = "\s*its?"
user = `git config --get user.name`.strip
since_commit = ARGV[0] || "master"
git_log = "git log --author=#{user} --remove-empty --oneline --unified=0 --ignore-all-space #{since_commit}..HEAD"

p git_log

plus_grep = "#{git_log} | grep -E '^\\+#{testcase_regexp}' -c"
minus_grep = "#{git_log} | grep -E '^-#{testcase_regexp}' -c"

#p plus_grep
#p minus_grep

plus_count = `#{plus_grep}`.strip.to_i
minus_count = `#{minus_grep}`.strip.to_i

p "plus=#{plus_count}, minus=#{minus_count}, diff=#{plus_count - minus_count}"

