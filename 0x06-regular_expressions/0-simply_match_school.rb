#!/usr/bin/env ruby
# print regular expression for School

input = ARGV[0]
count = input.scan(/School/).join
puts count
