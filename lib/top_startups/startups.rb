class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding

  def self.today
    self.scrape_rankings
  end

  def self.scrape_rankings
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
end
