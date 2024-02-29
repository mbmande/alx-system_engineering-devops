#!/usr/bin/env ruby
# =======

input = ARGV[0]
count = input.scan(/hb?tn/).join
puts count
