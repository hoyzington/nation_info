require 'nokogiri'
require 'open-uri'


class Scraper
  
  
  
end

data = Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html'))

list = data.css("tbody a")

name = list[1].text
puts name

url = list[1].css("href")
puts url
