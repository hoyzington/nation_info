require 'nokogiri'
require 'open-uri'


class Scraper
  
  def initialize
    @base_path = "http://www.geognos.com"
  end
  
  def self.get_nations
    result = []
    nations = Nokogiri::HTML(open(@base_path + "/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html")).css("tbody tr")
    nations.each_with_index do |n, i|
      data = n.css("a")[1]
      result[i] = {:name => data.text, :url => data.attribute("href").value}
    end
    result
  end
  
  def self.nation_info(nation_url)
    data = Nokogiri::HTML(open(@base_path + nation_url))
    result = {
      :location => data.css("#Location p").text,
      :size => data.css("#Area td").children[1].text + " sq km",
      :climate => data.css("#Climate p").text.capitalize,
      :population => data.css("#Population p").text,
      :religions => reformatter(nation_data, "#Religions"),
      :languages => reformatter(nation_data, "#Languages"),
      :capital => data.css("#Capital .geo").text,
      :ppp_per_capita => "$" + data.css("#GDP tbody").children[7].css("td")[1].text
    }
    result
  end
    
  def reformatter(data, info)
    stats = data.css("#{info} tbody td").children
    string_pieces = []
    stats.each do |d|
      string_pieces << d.text
    end
    data_array = []
    data_count = string_pieces.count / 3
    data_count.times do 
      joiner = []
      3.times {joiner << string_pieces.shift}
      data_array << joiner.join(" ")
    end
    data_array
  end

end


# afgan = Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html')).css("tbody tr")[0].css("a")[1]

# afgan_data = Nokogiri::HTML(open("http://www.geognos.com/geo/en/cc/af.html"))
