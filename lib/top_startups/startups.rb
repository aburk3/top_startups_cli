class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding
  @@all = []

  # This method scrapes the main page of the startup rankings and assigns instance variables
  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
