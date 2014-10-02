#!/usr/bin/env ruby

require 'random/online'

nWords = ARGV.empty?() ? 4 : ARGV[0].to_i

map = {}

File.open('diceware.wordlist.asc.txt').each do |line|
	next unless line =~ /^[0-9]+/

	dice, word = line.split(/\s+/)
	map[dice] = word
end

generator = RealRand::FourmiLab.new

phrase = []
(1..nWords).each do |ix|
  key = generator.randbyte(5).map {|i| i % 6 + 1}.join("")
  phrase << map[key]
end

puts phrase.join(" ")