class NationInfo::Nation
  
  attr_accessor :name, :url, :location, :size, :climate, :population, :capital
  
  @@all = []
  
  def initialize(first_hash)
    first_hash.each {|k, v| self.send(("#{k}="), v)}
  end
  
  def self.create_from_array(nations_array)
    nations_array.each do |item|
      nation = self.new(item)
      @@all << nation
    end
  end
  
  def add_info(second_hash)
    second_hash.each {|k, v| self.send(("#{k}="), v)}
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_name(name_of_nation)
    self.all.detect {|n| n.name == name_of_nation}
  end
  
end