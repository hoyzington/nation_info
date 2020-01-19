class NationInfo::CLI
  
  def run
    welcome
    level_one
  end
  
  def welcome
    puts " "
    puts " "
    puts "NationInfo".colorize(:light_green)
    puts " "
    puts "Basic information on every nation of the world!"
    puts "(As recognized by The International Organization of Standardization)".colorize(:light_blue)
    puts " "
  end
  
  def level_one
    done = "no"
    until done == "yes"
      puts "Enter "+"C".colorize(:light_green)+" to continue to the list of nations"
      puts "Enter "+"E".colorize(:light_green)+" to exit"
      puts " "
      input = gets.strip.upcase
      if input == "E"
        result = ending
        done = "yes"
      elsif input == "C"
        result = level_two
        done = "yes"
      else
        invalid
      end
    end
    result
  end
      
  def level_two
    get_list
    print_list
    choose_nation
  end
  
  def get_list
    NationInfo::Nation.create_from_array(NationInfo::Scraper.get_nations)
  end
 
 def print_list 
    NationInfo::Nation.all.each_with_index{|n, i| puts "#{i + 1}.".colorize(:light_blue)+" #{n.name}"}
    puts " "
  end
  
  def choose_nation
    choices_one
    input = nil
    until input == "E"
      input = gets.strip.upcase
      if input == "P"
        print_list
        choices_one
      elsif input != "E"
        input = input.to_i
        if (1..(NationInfo::Nation.all.count)).include?(input)
          nation = NationInfo::Nation.all[input - 1]
          nation_info(nation)
          choices_two
        else
          invalid
          choices_two
        end
      else
        result = ending
      end
    end
    result
  end
  
  def choices_one
    puts "Enter a "+"number".colorize(:light_green)+" from the list above to learn more about a nation"
    puts " "
    puts "Enter "+"E".colorize(:light_green)+" to exit"
    puts " "
  end
  
  def choices_two
    puts " "
    puts "Enter a "+"number".colorize(:light_green)+" from the list above"
    puts "Or to print the list again, enter "+"P".colorize(:light_green)
    puts " "
    puts "Enter "+"E".colorize(:light_green)+" to exit"
    puts " "
  end
  
  def nation_info(nation)
    nation.add_info(NationInfo::Scraper.get_info(nation.url))
    puts " "
    puts nation.name.upcase.colorize(:light_green)
    puts " "
    if nation.capital == nil
      puts "Capital:".colorize(:light_blue) + " N/A"
    else
      puts "Capital:".colorize(:light_blue) + " #{nation.capital.text}"
    end
    puts " "
    if nation.location == nil
      puts "Location:".colorize(:light_blue) + " N/A"
    else
      puts "Location:".colorize(:light_blue) + " #{nation.location.text.capitalize}"
    end
    puts " "
    if nation.size == nil
      puts "Size:".colorize(:light_blue) + " N/A"
    else
      puts "Size:".colorize(:light_blue) + " #{nation.size.text} sq km"
    end
    puts " "
    if nation.population == nil
      puts "Population:".colorize(:light_blue) + " N/A"
    else
      puts "Population:".colorize(:light_blue) + " #{nation.population.text}"
    end
    puts " "
    if nation.climate == nil
      puts "Climate:".colorize(:light_blue) + " N/A"
    else
      puts "Climate:".colorize(:light_blue) + " #{nation.climate.text.capitalize}"
    end
    puts " "
  end
  
  def invalid
    puts " "
    puts "Invalid entry".colorize(:red)
    puts " "
  end
  
  def ending
    puts " "
    puts " "
    puts "Thank you for using "+"NationInfo".colorize(:light_green)+"!"
    puts " "
    puts "Goodbye "+":)".colorize(:yellow)
    puts " "
    puts " "
  end
  
end

