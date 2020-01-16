require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './nation_info/version'
require_relative './nation_info/scraper'
require_relative './nation_info/nation'


module NationInfo
  class Error < StandardError; end
  # Your code goes here...
end
