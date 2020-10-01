#make a call to an API and retrieve information using the net/http and json gems

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



# 6 - 8: The class method .get_anime is called on the current instance which allows the user to give a keyword that is used as a search query. Receives a response as 

# 9 : response converted into a hash data structure

# 10 - 11: Now that I can iterate through the hash, I create a new instance of Anime and am grabbing and storing specific information (title, description, keyword) as an object into @@all
