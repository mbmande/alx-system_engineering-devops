#!/usr/bin/env ruby
# ===============

input =  ARGV[0]
count = input.scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(",")
puts count

