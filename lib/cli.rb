class CLI
  attr_accessor :anime
  
  def menu
    puts ""
    puts "Welcome to the Anime Recommender"
    puts "______________________________________"
    puts ""
    puts "Enter a keyword to pull up a list of recommendations:"
    @keyword = gets.strip.downcase
    API.get_anime(@keyword)
    print_anime
    prompt

    input = gets.strip.downcase
    while input != 'exit' do
      if input == 'keyword'
        #@keyword == gets.strip.downcase
        API.get_anime(@keyword) if Anime.find_by_keyword(@keyword).length == 0 
        print_anime
        prompt
    
      elsif input.to_i > 0 && input.to_i <= Anime.find_by_keyword(@keyword).count
      #binding.pry Anime.all entire array of objects
        @anime = Anime.find_by_keyword(@keyword)[input.to_i-1]
        API.get_anime(anime) if !anime.name
        print_anime_show

      else
        puts "Invalid input. Please try again!"
      end
      input = gets.strip.downcase
    end
    puts "Thank you for using the 'Anime Show Recommender'!"
    puts "Goodbye!"
  end
  
  
  def prompt
    puts ""
    puts "Enter a number to select a show and see a description, type 'keyword' to see the list again or 'exit' to exit."
    puts ""
  end
  
  
  def print_anime
    # Anime.all.each.with_index(1) do |a, i|
    #   puts "#{i}. #{a.name}"
    # end
    Anime.find_by_keyword(@keyword).each.with_index do |a, i|
      puts "#{i}. #{a.name}"
    end
  end
  
  def print_anime_show
    puts @anime
  end
  
  
end