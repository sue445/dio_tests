# -*- encoding: utf-8 -*-
require "yaml"

class DioTests::Client
  attr_reader :plus_count, :minus_count

  def initialize(args={})
    @format = args[:format]
    @since_commit = args[:since_commit] || "master"
    @author = args[:author] || git_config("user.name")
  end

  def print_test_count
    format_pattern = DioTests::Client.format_pattern(@format)
    log = git_log

    @plus_count = log.each_line.select{|line| line[0] == "+"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{format_pattern}/
        count
      } || 0

    @minus_count = log.each_line.select{|line| line[0] == "-"}.
      inject(0){|count, line|
        line[0] = ""
        count += 1 if line =~ /#{format_pattern}/
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

  def self.format_pattern(format)
    raise "format is require" unless format

    raise "Not found: #{format} in formats.yml" unless formats[format]
    formats[format]
  end

  def self.formats
    formats = YAML.load_file("#{File.dirname(__FILE__)}/formats.yml")
  end
end

