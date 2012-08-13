# -*- encoding: utf-8 -*-
#!/usr/bin/ruby

=begin
Usage: ruby dio_tests/rspec.rb <commit>
=end

$:.unshift File.dirname(__FILE__)
require 'dio_tests'

testcase_regexp = "\s*its?"

print_test_count testcase_regexp

