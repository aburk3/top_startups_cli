class TopStartups::Startups
  attr_accessor :name, :location, :rank, :srscore, :funding

  def self.today
    self.scrape_startups
  end

  def self.scrape_startups
    startups = []

    startups << self.scrape_ranking_one
    startups << self.scrape_ranking_two
    startups << self.scrape_ranking_three
    startups << self.scrape_ranking_four
    startups << self.scrape_ranking_five
    startups
  end

  # def self.scrape_ranking_one
  #   4.times do |i|
  #     doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))
  #     startups = self.new
  #     startups.name = doc.search(".ranks td.tleft div.name")[i].children.text
  #     startups.location = doc.search(".ranks td .f32").children.css("img")[i].attribute("title").value
  #     startups.rank = doc.search(".ranks").children.css("td:first-child")[0].text
  #     startups.srscore = doc.search(".ranks td.tright.sr-score")[i].children.text.strip
  #     startups
  #   end
  # end


  ##<Nokogiri::XML::Element:0x3fcc9649ccb0 name="td" children=[#<Nokogiri::XML::Text:0x3fcc96499600 "99">
  #doc.search(".ranks")[0].children.css("td")[0].text
  def self.scrape_ranking_one
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))
    binding.pry
    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[0].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[0].attribute("title").value
    startups.rank = doc.search(".ranks").children.css("td:first-child")[0].text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[0].children.text.strip
    startups
  end

  def self.scrape_ranking_two
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[1].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[1].attribute("title").value
    startups.rank = doc.search(".ranks").children.css("td:first-child")[1].text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[1].children.text.strip
    startups
  end

  def self.scrape_ranking_three
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[2].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[2].attribute("title").value
    startups.rank = doc.search(".ranks").children.css("td:first-child")[2].text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[2].children.text.strip
    startups
  end

  def self.scrape_ranking_four
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[3].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[3].attribute("title").value
    startups.rank = doc.search(".ranks").children.css("td:first-child")[3].text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[3].children.text.strip
    startups
  end

  def self.scrape_ranking_five
    doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))

    startups = self.new
    startups.name = doc.search(".ranks td.tleft div.name")[4].children.text
    startups.location = doc.search(".ranks td .f32").children.css("img")[4].attribute("title").value
    startups.rank = doc.search(".ranks").children.css("td:first-child")[4].text
    startups.srscore = doc.search(".ranks td.tright.sr-score")[4].children.text.strip
    startups
  end
end
