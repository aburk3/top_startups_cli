# CLI controller

class TopStartups::CLI

  def call
    list_startups
    user_menu
    goodbye
  end

  def list_startups
    puts "Today's Top Startups:"
    @startups = TopStartups::Startups.today
    @startups.each.with_index(1) do |startup, i|
      puts "#{i}. #{startup.name}"
    end
  end

  def user_menu
    input = nil
    while input != "exit"
      puts " "
      puts "Enter the number of the startup you would like more info on, type 'list' to see the startups, or you can type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 5
        the_startup = @startups[input.to_i-1]
        puts "---------------------------------------------"
        puts "#{the_startup.name}"
        puts <<~DOC
          Location: #{the_startup.location}
          Rank: #{the_startup.rank}
          SR Score: #{the_startup.srscore}
        DOC
      elsif input == "list"
        puts "---------------------------------------------"
        list_startups
      elsif input != "exit"
        puts "Did not recognize the input, please type list or exit."
      end
    end
  end

  def goodbye
    puts " "
    puts "Come back later to checkout new rankings!"
  end
end
