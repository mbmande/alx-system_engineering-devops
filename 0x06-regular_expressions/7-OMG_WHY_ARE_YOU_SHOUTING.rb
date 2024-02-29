#!/usr/bin/env ruby
# =======

input =  ARGV[0]
count = input.scan(/[A-Z]*/).join
puts count

