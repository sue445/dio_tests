# -*- encoding: utf-8 -*-
require "yaml"

class DioTests::Client
  attr_reader :plus_count, :minus_count

  def initialize(format_type, args={})
    @format_type = format_type
    @since_commit = args[:since_commit] || "master"
    @author = args[:author] || git_config("user.name")
  end

  def print_test_count
    log = git_log
    format = DioTests::Client.format(@format_type)

    @plus_count = log.each_line.select{|line| line[0] == "+"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{format}/
        count
      } || 0

    @minus_count = log.each_line.select{|line| line[0] == "-"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{format}/
        count
      } || 0

    puts "plus=#{@plus_count}, minus=#{@minus_count}, increment=#{@plus_count - @minus_count}"
  end

  def git_log
    git_log_command = "git log --author=#{@author} --remove-empty --oneline --unified=0 --ignore-all-space #{@since_commit}..HEAD"
    puts git_log_command
    `#{git_log_command}`
  end

  def git_config(name)
    `git config --get #{name}`.strip
  end

  def self.format(format_type)
    raise "format_type is require" unless format_type
    formats = YAML.load_file("#{File.dirname(__FILE__)}/formats.yml")

    raise "Not found: #{format_type} in formats.yml" unless formats[format_type]
    formats[format_type]
  end
end

