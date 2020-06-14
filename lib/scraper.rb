require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
     index_page = Nokogiri::HTML(open(index_url))
    students = []
    index_page.css("div.roster-body-wrapper").each do |student_card|
      student_card.css("div.student-card a").each do |student|
      student_name = student.css("h4.student-name").text
      student_location = student.css("p.student-location").text
      student_link = "#{student.attr('href')}"
      students << { name: student_name, location: student_location, profile_url: student_link }
      end
    end
    students
  end	  

  def self.scrape_profile_page(profile_url)
    
  end

end

