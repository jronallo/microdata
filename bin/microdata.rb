#! /usr/bin/env ruby

# microdata.rb 
# Extract HTML5 Microdata and output JSON
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'microdata'

location = ARGV[0]
content = open(location)
document = Microdata::Document.new(content, location)
items = document.extract_items

if items.empty? || items.nil?
  puts "No Microdata items found."
  itemprops = document.doc.search('//*[@itemprop]')
  if !itemprops.empty?
    puts "There are some itemprops, which means no top level items with an itemscope have been found."
  end
else
  hash = {}
  hash[:items] = items.map do |item|
    item.to_hash
  end
  puts JSON.pretty_generate(hash)
end