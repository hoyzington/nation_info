require 'nokogiri'
require 'open-uri'


class Scraper
  
  
  
end

data = Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html'))

list = data.css("tbody tr")
nation = list[i].css("a")[1]

name = nation.text
puts name

url = nation("href")
puts url

