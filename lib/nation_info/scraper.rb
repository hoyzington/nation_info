require 'nokogiri'
require 'open-uri'


class Scraper
  
  def initialize
    @base_path = "http://www.geognos.com"
  end
  
  def self.get_nations
    nations = Nokogiri::HTML(open(@base_path + "/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html")).css("tbody tr")
    nations.each do |n|
      data = n.css("a")[1]
      nation = Nation.new
      nation.name = data.text
      nation.url = data.attribute("href").value
    end
  end
  
  def self.nation_info(nation_url)
    Nokogiri::HTML(open(@base_path + nation_url))
  end
    
  
end



nation = list[i].css("a")[1]
name = nation.text
url = nation.attribute("href").value


afgan = Nokogiri::HTML(open('http://www.geognos.com/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html')).css("tbody tr")[0].css("a")[1]

nation_data = Nokogiri::HTML(open("http://www.geognos.com/geo/en/cc/af.html"))


location = nation_data.css("#Location p").text
size = nation_data.css("#Area td").children[1].text + " sq km"
climate = nation_data.css("#Climate p").text.capitalize
population = nation_data.css("#Population p").text
religions = reformatter(nation_data, "#Religions")
languages = reformatter(nation_data, "#Languages")

  def reformatter(nation_data, info)
    data = nation_data.css("#{info} tbody td").children
    string_pieces = []
    data.each do |d|
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


<tbody>
															<tr class="nm-cnt01 nm-odd">
																<td>Sunni Muslim</td>
																<td>80.00</td>
																<td>%</td>
															</tr>
															<tr class="nm-cnt02 nm-even">
																<td>Shia Muslim</td>
																<td>19.00</td>
																<td>%</td>
															</tr>
															<tr class="nm-cnt03 nm-odd">
																<td>other</td>
																<td>1.00</td>
																<td>%</td>
															</tr>
														</tbody>