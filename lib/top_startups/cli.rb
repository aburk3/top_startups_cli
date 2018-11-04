# CLI controller

class TopStartups::CLI

  def call
    puts "Today's Top Startups:"
    list_startups
    
  end

  def list_startups
    puts <<~DOC
      1. Medium - United States
      2. Airbnb - United States
      3. 500 px - Canada
      4. Uber - United States
      5. Canva - Australia
    DOC
  end
end
