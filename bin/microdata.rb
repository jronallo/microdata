#! /usr/bin/env ruby

# microdata.rb 
# Extract HTML5 Microdata and output JSON
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'microdata'

puts Microdata.to_json(ARGV[0])