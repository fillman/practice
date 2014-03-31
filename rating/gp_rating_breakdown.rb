require 'rubygems'
require 'bundler/setup'

# Require some dependencies
require 'nokogiri'
require 'httparty'


class Parser
  include HTTParty
  base_uri 'play.google.com'

  attr_reader :target

  # Target is a string representing android app
  def initialize(target)
    @target = target
  end


  def print_rate
    raise 'Application not found' if response.code == 404
    star = 5
    doc = Nokogiri::HTML(response.body)
    doc.css('.rating-histogram .bar-number').to_a.map(&:text).each do |number|
      puts "#{star} stars: #{number} \n"
      star -= 1
    end
  end

  def response
    @response ||= self.class.get('/store/apps/details', { query: {id: target} })
  end
end

# Uncoment this line if you'd like to use it as script
# ruby gp_rating_breakdown.rb com.rovio.angrybirds

# Parser.new(ARGV[0]).print_rate

