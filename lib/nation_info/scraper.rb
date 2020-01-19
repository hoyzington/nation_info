class NationInfo::Scraper
  
  @@base_path = "http://www.geognos.com"

  def self.get_nations
    result = []
    nations = Nokogiri::HTML(open(@@base_path + "/geo/en/countries-list/Country-Codes-ISO-3166-ISO-Numeric-ISO3-FIPS-ccTLD.html")).css("tbody tr")
    nations.each_with_index do |n, i|
      data = n.css("a")[1]
      result[i] = {name: data.text, url: data.attribute("href").value}
    end
    result
  end
  
  def self.get_info(nation_url)
    data = Nokogiri::HTML(open(@@base_path + nation_url))
    result = {
      location: data.css("#Location p"),
      size: data.css("#Area td").children[1],
      climate: data.css("#Climate p"),
      population: data.css("#Population p"),
      capital: data.css("#Capital .geo")
    }
  end
    
end
