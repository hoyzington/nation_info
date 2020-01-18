class CLI
  
  def make_list
    Nation.create_from_nations_array(Scraper.get_nations)
  end
  
  def print_list
    Nation.all.each_with_index{|n, i| puts "#{i + 1}. #{n.name}"
  end
  
  def nation_info(nation_number)
    n = Nation.all[nation_number - 1]
    n.add_info(Scraper.get_info(n.url))
  end
  
  def print_nation_info(nation)
    puts nation.name.upcase
    puts "Location:         #{nation.location}"
    puts "Size:             #{nation.size}"
    puts "Climate:          #{nation.climate}"
    puts "Population:       #{nation.population}"
    puts "Religions:        #{nation.religions}"
    puts "Languages:        #{nation.languages}"
    puts "Capital:          #{nation.capital}"
    puts "GDP* per capita:  #{nation.ppp_per_capita}"
    puts "*Gross Domestic Product (Purchasing Power Parity)"
  end
  
  def start
    make_list
    print_list
    
  end
  
end

