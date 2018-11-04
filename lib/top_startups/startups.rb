class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding, :url
  def self.today

    startup_1 = self.new
    startup_1.name = "Medium"
    startup_1.location = "United States"
    startup_1.rank = "1"
    startup_1.srscore = "90,889"
    startup_1.funding = "$50,000,000"
    startup_1.url = "https://www.startupranking.com/medium"

    startup_2 = self.new
    startup_2.name = "Airbnb"
    startup_2.location = "United States"
    startup_2.rank = "2"
    startup_2.srscore = "90,653"
    startup_2.funding = "$447,800,000"
    startup_2.url = "https://www.startupranking.com/airbnb"

    [startup_1, startup_2]
  end

end
