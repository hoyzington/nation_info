class Nation
  
  attr_accessor :name, :url, :location, :size, :climate, :population, :religions, :languages, :capital, :ppp_per_capita
  
  @@all = []
  
  def initialize(nation_hash)
    nation_hash.each {|k, v| self.send(("#{k}="), v)}
  end
  
  def self.create_from_array(nations_array)
    nations_array.each do |nation|
      self.new(nation)
      @@all << self
    end
  end
  
  def add_info(nation_hash)
    nation_hash.each {|k, v| self.send(("#{k}="), v)}
  end
  
  def self.all
    @@all
  end
    
end