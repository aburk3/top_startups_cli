class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding, :url

  def self.today
    self.scrape_startups
  end

  def self.scrape_startups
    startups = []

    startups << self.scrape_ranking

    startups
  end

  def self.scrape_ranking
    doc = Nokogiri::HTML(open(https://www.startupranking.com/top))
    
  end

end
