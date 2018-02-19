require 'open-uri'
require 'pry'
class Scraper

# html = File.read('../fixtures/student-site/index.html')
# doc = Nokogiri::HTML(html)

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_array = []
    doc.css("div.roster-cards-container").each do |card|
      card.css("div.student-card a").each do |individual|
         name = individual.css("h4").text
         location = individual.css("p").text
         profile = individual.select {|nd| nd}[0][1]
         student_array << {:name => name, :location => location, :profile_url => profile}
      end
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    media_links = {}
    doc.css("div.social-icon-container").each do |link|
      link.css("a").each do |i|
        if i.attributes["href"].include?("twitter")
          binding.pry
          media_links[:twitter] = i.attributes["href"].value
        elsif
      end
    end
      # twitter = link.css("a")[0].values[0]
      # linkedin = link.css("a")[1].values[0]
      # github = link.css("a")[2].values[0]
      # blog = link.css("a")[3].values[0]
      # bio = doc.css("div.description-holder p").text
      # profile_quote = doc.css("div.profile-quote").text
      # media_links = {:bio => bio, :profile_quote => profile_quote, :twitter => twitter, :linkedin => linkedin, :github => github, :blog => blog}
    end
    binding.pry
    media_links
  end

end
