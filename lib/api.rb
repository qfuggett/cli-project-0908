#make a call to an API and retrieve information

class API
  
  def self.get_anime(keyword)
    url="https://api.jikan.moe/v3/search/anime?q=#{keyword}"
    uri=URI(url)
    response=Net::HTTP.get(uri)

    animeshows=JSON.parse(response) # ["title"].each do |a|
    #   Anime.new(name: c[])
    binding.pry
  end
  
end