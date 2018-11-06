class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding

  def self.today
    self.scrape_main
    self.scrape_details
  end

  # This method scrapes the main page of the startup rankings and assigns instance variables
  def self.scrape_main
      doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

      startup_array = []
    25.times do |i|
      startups = self.new
      startups.name = doc.search(".ranks td.tleft div.name")[i].children.text
      startups.location = doc.search(".ranks td .f32").children.css("img")[i].attribute("title").value
      startups.rank = doc.search(".ranks").children.css("td:first-child")[i].text
      startups.srscore = doc.search(".ranks td.tright.sr-score")[i].children.text.strip
      startup_array << startups
    end
    startup_array
  end

  # This methods uses the @name instance variable to obtain the startups 'details' URL
  # It then scrapes this page for funding information and assigns it to an instance variable
  def self.scrape_details
    self.scrape_main.each do |startup|
      doc = Nokogiri::HTML(open("https://www.startupranking.com/#{startup.name.gsub!(/\s+/, '')}"))
      startup.funding = doc.search(".ranks").children.css("span")[0].text.gsub(" ", "").strip
    end
  end


end
