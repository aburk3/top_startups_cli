# CLI controller

class TopStartups::CLI

  def call
    list_startups
    menu
    goodbye
  end

  def list_startups
    puts "Today's Top Startups:"
    @startups = TopStartups::Startups.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the startup you would like more info on, type 'list' to see the startups, or you can type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on startup 1..."
      when "2"
        puts "More info on startup 2..."
      when "list"
        list_startups
      else
        puts "Did not recognize, please type list or exit."
      end
    end
  end

  def goodbye
    puts "Come back later to checkout new rankings!"
  end
end
