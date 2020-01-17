class Nation
  
  attr_reader :name, :url, :location, :size, :climate, :population, :religions, :languages, :capital, :ppp_per_capita
  
  @@all
  
  def initialize(nation_hash)
    nation_hash.each {|k, v| self.send(("#{k}="), v)
    @@all << self
  end
  
  def self.create_from_nations_array(nations_array)
    nations_array.each {|nation| self.new(nation)
  end
  
  def self.add_nation_info(nation_hash)
    nation_hash.each {|k, v| self.send(("#{k}="), v)
  end
  
  def self.all
    @@all
  end
    
end