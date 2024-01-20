require "nokogiri"
require "httparty"
require "byebug"
require_relative "./country.rb"

module Scraper
  INDEX_URL = 'https://www.scrapethissite.com/pages/simple/'
def self.scrape_countries
unparsed_page = HTTParty.get(INDEX_URL)
parsed_page = Nokogiri::HTML(unparsed_page.body)
    #puts parsed_page
countries = parsed_page.css("div.country")
      #puts countries
countries.each do |country|
name = country.css(".country-name").text.strip
      capital = country.css(".country-capital").text.strip
population = country.css(".country-population").text.strip
      area = country.css(".country-area").text.strip
      #debugger; # <---- Add this line
      puts "#{name} #{capital} #{population} #{area}"
      Country.new(name, capital, population, area)
    end
  end
end