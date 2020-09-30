class Anime
  attr_accessor :name, :anime_id
  
  @@all = [ ]
  
  def initialize(name: nil, keyword: nil, anime_id: nil)
    @name = name
    @keyword = keyword
    @anime_id = anime_id
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