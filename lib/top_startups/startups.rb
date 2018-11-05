class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding

  def self.today
    self.scrape_startups
  end

  def self.scrape_startups
    startups = []

    startups << self.scrape_ranking

    startups
  end

  def self.scrape_ranking
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[0].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[0].attribute("title").value
    startups.rank = doc.search(".ranks td .f32").children.css("div")[0].children.text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[0].children.text.strip
    startups
  end
end

# doc.search(".ranks td .f32").children[3]
# => #(Element:0x3fddc4d1fdd0 { name = "div", attributes = [ #(Attr:0x3fddc4d1fd6c { name = "class", value = "country-rank" })], children = [ #(Text "1")] })
