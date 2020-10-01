class Anime
  attr_accessor :name, :description, :keyword, :anime
  
  @@all = [ ]
  
  def initialize(name:, keyword:, description:)
    @name = name
    @keyword = keyword
    @description = description
    @@all << self   #stores all new instances as an object inside @@all 
  end
    
    
  def self.all    #returns all instances as an array of all the objects
    @@all         
  end
  
  
  def self.find_by_keyword(keyword)
    self.all.select do |a|
      a.keyword == keyword      #returns what I am looking for (keyword) as a subset
    end
  end
  
end