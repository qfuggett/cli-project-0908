class Anime
  attr_accessor :name, :description, :keyword, :anime
  
  @@all = [ ]
  
  def initialize(name:, keyword:, description:)
    @name = name
    @keyword = keyword
    @description = description
    @@all << self   
  end
    
    
  def self.all    
    @@all         
  end
  
  
  def self.find_by_keyword(keyword)
    self.all.select do |a|
      a.keyword == keyword      
    end
  end
end