#!/usr/bin/env ruby

require 'open-uri'
require_relative '../config/environment'



username = 'j-shilling'

def get_repository_list_for_user(username)
  "https://github.com/#{username}?tab=repositories"
end

def get_doc(username)
  # Get the address
  url = get_repository_list_for_user(username)
  # Open the webpage
  html = open(url)
  # Parse the webpage
  doc = Nokogiri::HTML(html)
end

def get_anchors(username)
  selector = "div#user-repositories-list ul li h3 a"
  get_doc(username).css(selector)
end

def get_repository_names(username)
  get_anchors(username).map do |a|
    a.text.strip
  end
end

# CSS Selector
# tag name: div, a, label, button...... "input"
# id: "#jump-to-results"
# class: ".d-none"

# "input.d-none" "div#main" "div#main li.even-number"

puts "Enter your github username: "
username = gets.strip

puts get_repository_names(username)
