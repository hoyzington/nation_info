class CLI
  
  def nation_list
    Nation.create_from_array(Scraper.get_nations)
    Nation.all.each_with_index{|n, i| puts "#{i + 1}. #{n.name}"}
    puts " "
  end
  
  def nation_info(nation)
    nation.add_info(Scraper.get_info(nation.url))
    puts " "
    puts nation.name.upcase
    puts " "
    puts "Capital:          #{nation.capital}"
    puts "Location:         #{nation.location}"
    puts "Size:             #{nation.size}"
    puts "Population:       #{nation.population}"
    puts "Climate:          #{nation.climate}"
#    puts "Religions:        #{nation.religions}"
#    puts "Languages:        #{nation.languages}"
    puts "GDP* per capita:  #{nation.ppp_per_capita}"
    puts "*Gross Domestic Product (Purchasing Power Parity) in U.S. $"
  end
  
  def welcome
    puts " "
    puts "NationInfo"
    puts " "
    puts "Basic information on every nation of the world"
    puts "(As recognized by The International Organization of Standardization)"
    puts " "
  end
  
  def continue
    result = invalid
    until result != invalid
      puts "Enter C to continue to the list of nations"
      puts "Enter E to exit"
      puts " "
      input = gets.strip.upcase
      if input == "E"
        result = ending
      elsif input == "C"
        result = nation_list
      else
        result
      end
    end
    result
  end
      
  def choose_nation
    input = nil
    until input == "E"
      puts "Enter a number from the list above to learn more about a nation"
      puts " "
      puts "Enter E to exit"
      puts " "
      input = gets.strip.upcase
      if input != "E"
        input = input.to_i
        if [1..(Nation.all.count)].include?(input)
          nation = Nation.all[input]
          nation_info(nation)
        else
          invalid
        end
      end
    end
    ending
  end
  
  def invalid
    puts " "
    puts "Invalid entry"
    puts " "
  end
  
  def ending
    puts " "
    puts "Thank you for using NationInfo"
    puts "Goodbye"
    puts " "
  end
  
  def run
    welcome
    continue
    
    nation = Nation.all[0]
    nation_info(nation)
    print_nation_info(nation)
    binding.pry
  end
  
end

