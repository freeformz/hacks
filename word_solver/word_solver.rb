#!/usr/bin/env ruby

require 'pp'

search_letters = ARGV.map(&:upcase)

words = File.open('sowpods.txt','r') { |f| f.read.split("\r\n") }

# BRUTE force FTL
found_words = words.select do |word| 
  letters = search_letters.clone
  word.chars.all? do |char|
    if pos = letters.index(char)
      letters.delete_at(pos)
      true
    else
      false
    end
  end
end

pp found_words.flatten.compact.sort {|a,b| a.length <=> b.length }.select {|w| w.length <= 8 }
