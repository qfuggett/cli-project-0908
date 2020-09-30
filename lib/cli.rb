class CLI
  
  def menu
    puts ""
    puts "Welcome to the Anime Recommender"
    puts "______________________________________"
    puts ""
    puts "Enter a keyword from the list below:"
    @keyword = gets.strip.downcase
    API.get_anime(@keyword)
  end
  
  
  
  
end