# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "nokogiri"

url = "http://www.visitdenmark.com/copenhagen/gastronomy/smorrebrod-restaurants-copenhagen"
html_file = open(url)

doc = Nokogiri::HTML(html_file)

doc.search(".gdkProduct").each do |smorrebrod|
  p smorrebrod.search(".ProductImage")[0].attr("src")
  p smorrebrod.search("h2").text
  p smorrebrod.search(".ProductTextList")[0].text.strip
  p "*" * 10
end
