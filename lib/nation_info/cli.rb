class CLI
  
  def self.nations_list
    Nation.create_from_nations_array(Scraper.get_nations)
  end
  
  def self.nation_info(nation_url)
    Nation.add_nation_info(Scraper.get_nation_info(nation_url))
  end
  
  def start
    puts self.nations_list
    puts self.nation_info("/geo/en/cc/af.html")
  end
  
end

