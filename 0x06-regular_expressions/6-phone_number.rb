#!/usr/bin/env ruby
# =======

input = ARGV[0]
count = input.scan(/^\d{10}$/).join
puts count

