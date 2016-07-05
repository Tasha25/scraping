# 07/04/16 A really long way to scrape information from online.
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

WESTCHESTER = "http://www.nymetroparents.com/westchester/article/Westchester-County-Camp-and-Summer-Program-Guide-Section-1Day-Camps"
MANHATTAN = "http://www.nymetroparents.com/manhattan/article/Manhattan-Camps-and-Summer-Programs-for-Kids-2011-Guide"

BROOKLYN ="http://www.nymetroparents.com/brooklyn/article/Brooklyn-Camps-and-Summer-Programs-for-Kids-2011-Guide"

QUEENS ="http://www.nymetroparents.com/queens/article/Queens-Camps-and-Summer-Programs-for-Kids-2011-Guide"

LONG_ISLAND = "http://www.nymetroparents.com/article/Nassau-CountyLong-IslandCamps-and-Summer-Programs-for-Kids-2011-Guide"


metro_westchester = Nokogiri::HTML(open(WESTCHESTER))
metro_manhattan = Nokogiri::HTML(open(MANHATTAN))
metro_brooklyn = Nokogiri::HTML(open(BROOKLYN))
metro_queens = Nokogiri::HTML(open(QUEENS))
metro_long_island = Nokogiri::HTML(open(LONG_ISLAND))

selector = "//a[starts-with(@href, \"mailto:\")]/@href"


#--> This gives you all hrefs on the page.
 # page.xpath('//a/@href').each do |node|
 #      puts node.text
 #    end

#--> This gives you all the emails that starts with "mailto" on the page. They are all in anchor tags.

# nodes = page.xpath selector
# puts nodes

# --> This givs you all hrefs and will strip the mailto
nodes_westchester = metro_westchester.xpath selector
nodes_manhattan = metro_manhattan.xpath selector
nodes_brooklyn = metro_manhattan.xpath selector
nodes_queens = metro_queens.xpath selector
nodes_long_island = metro_long_island.xpath selector

addresses_westchester = nodes_westchester.collect do |n|
      n.value[7..-1]
  end

addresses_manhattan = nodes_manhattan.collect do |n|
      n.value[7..-1]
  end

addresses_brooklyn = nodes_brooklyn.collect do |n|
      n.value[7..-1]
  end

addresses_queens = nodes_queens.collect do |n|
      n.value[7..-1]
  end

addresses_long_island = nodes_long_island.collect do |n|
      n.value[7..-1]
  end

# --> Just seeing if it was an array. You can shove it in an empty array
# list = []
# addresses_westchester.each do |a|
#     list << a
#   end


CSV.open("emails_westchester.csv", "w") do |file|
  print "Westchester"
  addresses_westchester.each do |line|
    file << [line]
  end
end

CSV.open("emails_manhattan.csv", "w") do |file|
  print "Manhattan"
  addresses_manhattan.each do |line|
    file << [line]
  end
end

CSV.open("emails_brooklyn.csv", "w") do |file|
  print "Brooklyn"
  addresses_brooklyn.each do |line|
    file << [line]
  end
end

CSV.open("emails_queens.csv", "w") do |file|
  print "Queens"
  addresses_queens.each do |line|
    file << [line]
  end
end

CSV.open("emails_long_island.csv", "w") do |file|
  print "Long Island"
  addresses_long_island.each do |line|
    file << [line]
  end
end