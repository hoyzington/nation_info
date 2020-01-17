require 'nokogiri'
require 'open-uri'


class Scraper
  
  def self.get_nations
    Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html')).css("tbody tr")
  end
  
  def self.get_nation(nation_url)
    
  end
    
  
end



nation = list[i].css("a")[1]

name = nation.text

url = nation.attribute("href").value


afgan = Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html')).css("tbody tr")[0].css("a")[1]