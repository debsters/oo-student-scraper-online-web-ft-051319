require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
  	doc = Nokogiri::HTML(File.read(index_url))
		students = []
    doc.css(".student-card").each do |student|
      students << {
        :name => student.css(".card-text-container h4.student-name").text,
        :location => student.css(".card-text-container p.student-location").text,
        :profile_url => student.css("a").attribute("href").value
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
