# frozen_string_literal: true

require 'uri'
require 'pry'
require 'net/http'
require 'nokogiri'

# Contains methods for fetching a webpage and returning the img srcs and anchor links in the HTML source
class Webpage
  def self.fetch(url)
    raise 'Invalid URL' unless valid_url? url

    parsed_html = parse_html get_html(url)
    { assets: get_imgs(parsed_html), links: get_anchors(parsed_html) }
  end

  def self.parse_html(html)
    Nokogiri::HTML(html)
  end

  def self.get_imgs(doc)
    doc.css('img').map { |i| i['src'] }
  end

  def self.get_anchors(doc)
    doc.css('a').map { |i| i['href'] }
  end

  def self.get_html(url)
    Net::HTTP.get(url, '/index.html')
  end

  def self.valid_url?(uri)
    uri = URI.parse(uri)
    if uri.is_a?(URI::HTTP) && !uri.host.nil?
      true
    else
      raise 'Invalid URL'
    end
  end
end
