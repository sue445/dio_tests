# -*- encoding: utf-8 -*-

class DioTests
  attr_reader :plus_count, :minus_count

  def print_test_count(testcase_regexp)
    log = git_log

    @plus_count = log.each_line.select{|line| line[0] == "+"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{testcase_regexp}/
        count
      } || 0

    @minus_count = log.each_line.select{|line| line[0] == "-"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{testcase_regexp}/
        count
      } || 0

    puts "plus=#{@plus_count}, minus=#{@minus_count}, increment=#{@plus_count - @minus_count}"
  end

  def git_log
    author = `git config --get user.name`.strip
    since_commit = ARGV[0] || "master"

    git_log_command = "git log --author=#{author} --remove-empty --oneline --unified=0 --ignore-all-space #{since_commit}..HEAD"
    puts git_log_command
    `#{git_log_command}`
  end
end

