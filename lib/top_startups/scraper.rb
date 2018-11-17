class TopStartups::Scraper
  def self.scrape_main
      doc = Nokogiri::HTML(open("https://www.startupranking.com/top"))
    5.times do |i|
      startups = TopStartups::Startups.new
      startups.name = doc.search(".ranks td.tleft div.name")[i].children.text
      startups.location = doc.search(".ranks td .f32").children.css("img")[i].attribute("title").value
      startups.rank = doc.search(".ranks").children.css("td:first-child")[i].text
      startups.srscore = doc.search(".ranks td.tright.sr-score")[i].children.text.strip
    end
  end

  # This methods uses the @name instance variable to obtain the startups 'details' URL
  # It then scrapes this page for funding information and assigns it to an instance variable
  def self.scrape_details(startup)
      startup.name.gsub!(/\s+/, '')
      doc = Nokogiri::HTML(open("https://www.startupranking.com/#{startup.name}"))
      startup.funding = doc.search(".ranks td span").first.text
  end
end
