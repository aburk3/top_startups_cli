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
    @startups.each.with_index(1) do |startup, i|
      puts "#{i}. #{startup.name} - #{startup.location}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the startup you would like more info on, type 'list' to see the startups, or you can type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_startup = @startups[input.to_i-1]
        puts "#{the_startup.name} - #{the_startup.location}"
      elsif input == "list"
        list_startups
      else
        puts "Did not recognize the input, please type list or exit."
      end
    end
  end

  def goodbye
    puts "Come back later to checkout new rankings!"
  end
end
