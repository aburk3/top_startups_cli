class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding

  def self.today
    self.scrape_main
    self.scrape_details
  end

  def self.scrape_main
      doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

      startup_array = []
    5.times do |i|
      startups = self.new
      startups.name = doc.search(".ranks td.tleft div.name")[i].children.text
      startups.location = doc.search(".ranks td .f32").children.css("img")[i].attribute("title").value
      startups.rank = doc.search(".ranks").children.css("td:first-child")[i].text
      startups.srscore = doc.search(".ranks td.tright.sr-score")[i].children.text.strip
      startup_array << startups
    end
    startup_array
  end

  def self.scrape_details
    # Takes argument and gsubs 'top' with 'url' for the details page of the startup in order to scrape for latest funding details
    self.scrape_main.each do |startup|
      doc = Nokogiri::HTML(open("https://www.startupranking.com/#{startup.name}"))
      binding.pry
      # startup.funding =
    end
  end
end
