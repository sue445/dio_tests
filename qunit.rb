# -*- encoding: utf-8 -*-
#!/usr/bin/ruby

=begin
Usage: ruby dio_tests/qunit.rb <commit>
=end

$:.unshift File.dirname(__FILE__)
require 'dio_tests'

DioTests.new.print_test_count "^\s*test"

