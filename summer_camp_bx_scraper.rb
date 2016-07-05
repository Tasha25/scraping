require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

BASE_URL = "http://www.bronxsummercamps.com/"
page = Nokogiri::HTML(open(BASE_URL))

selector = "//a[starts-with(@href, \"mailto:\")]/@href"

# The selector //a will select any a tags on the page, and you can specify the href attribute using @ syntax, so //a/@href will give you the hrefs of all a tags on the page.

# If there are a mix of possible a tags on the page with different urls types (e.g. http:// urls) you can use xpath functions to further narrow down the selected nodes. The selector

# //a[starts-with(@href, \"mailto:\")]/@href
# will give you the href nodes of all a tags that have a href attribute that starts with "mailto:".

# Putting this all together, and adding a little extra code to strip out the "mailto:" from the start of the attribute value:


nodes = page.xpath selector

addresses = nodes.collect {|n| n.value[7..-1]
}

CSV.open("emails2.csv", "a+") do |csv|
  csv << addresses
end

