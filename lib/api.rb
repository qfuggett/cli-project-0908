class API
  
  def self.get_anime(keyword)
    url="https://api.jikan.moe/v3/search/anime?q=#{keyword}"
    uri=URI(url)
    response=Net::HTTP.get(uri)    
    animeshows=JSON.parse(response)["results"]    
    animeshows.each do |a|
      Anime.new(name: a["title"], description: a["synopsis"], keyword: keyword) if a["title"] != nil
    end
  end
end
