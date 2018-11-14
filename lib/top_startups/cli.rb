# CLI controller
class TopStartups::CLI

  def call
    list_startups
    user_menu
    goodbye
  end

  def list_startups
    puts "Today's Top Startups: (type 'refresh' to update now)"
    @startups ||= TopStartups::Startups.refresh 
    @startups.each.with_index(1) do |startup, i|
      puts "#{i}. #{startup.name}"
    end
  end

  def user_menu
    input = nil
    while input != "exit"
      puts " "
      puts "Enter the number of the startup you would like more info on, type 'list' to see the startups, or you can type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 5
        details(input)
      elsif input == "list"
        puts "---------------------------------------------"
        list_startups
      elsif input == "refresh"
        TopStartups::Startups.refresh
        list_startups
      elsif input != "exit"
        puts "Did not recognize the input, please type list or exit."
      end
    end
  end

  def details(input)
    the_startup = @startups[input.to_i-1]
    puts "---------------------------------------------"
    puts "#{the_startup.name}"
    puts <<~DOC
      Location: #{the_startup.location}
      Rank: #{the_startup.rank}
      SR Score: #{the_startup.srscore}
      Latest Funding: #{the_startup.funding}
    DOC
  end

  def goodbye
    puts " "
    puts "Come back later to checkout new rankings!"
  end
end
