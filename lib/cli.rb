class CLI
  attr_accessor :anime
  
  def menu
    puts ""
    puts "Welcome to the Anime Show Recommender"
    puts "_____________________________________"
    puts ""
    puts "Enter a keyword to pull up a list of recommendations:"
    
    @keyword = gets.strip.downcase
    if API.new.get_anime(@keyword).count == 0
      puts "Your keyword has no matching anime. Please try a different keyword."
      @keyword = gets.strip.downcase
      
      while API.new.get_anime(@keyword).count == 0
        puts "Your keyword has no matching anime. Please try a different keyword."
        @keyword = gets.strip.downcase
      end
      print_anime
      prompt
    
    else
      print_anime
      prompt
    end

    input = gets.strip.downcase
    while input != 'exit' do
      
      if input == 'keyword'
        API.get_anime(@keyword) if Anime.find_by_keyword(@keyword).length == 0 
        print_anime
        prompt
        
      elsif input.to_i > 0 && input.to_i <= Anime.find_by_keyword(@keyword).count
        @anime = Anime.find_by_keyword(@keyword)[input.to_i]
        API.get_anime(anime) if !anime.name
        print_anime_show

      else
        puts "Invalid input. Please try again! Enter 'keyword' to see the list again."
      end
      input = gets.strip.downcase
    end
    puts ""
    puts "Thank you for using 'Anime Show Recommender'!"
    puts "Goodbye!"
  end
  
  
  def prompt
    puts ""
    puts "Enter a number to select a show and see a description, type 'keyword' to see the list again or 'exit' to exit."
    puts ""
  end
  
  
  def print_anime
    puts ""
    puts "Recommendations:"
    Anime.find_by_keyword(@keyword).each.with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end
  end
  
  
  def print_anime_show
    puts ""
    puts @anime.name
    puts @anime.description
    puts "✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧"
    puts ""
    puts "Type 'keyword' to see the list again, or 'exit' to exit."
  end
end