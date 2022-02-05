# frozen_string_literal: true

require 'uri'
require 'pry'
require 'net/http'
require 'nokogiri'
require 'helpers/html_tags'

# Contains methods for fetching a webpage and returning the img srcs and anchor links in the HTML source
class Webpage
  include HTMLTags

  def fetch(url)
    raise 'Invalid URL' unless valid_url? url

    parsed_html = parse_html(get_html(url))

    {
      assets: HTMLTags.get_imgs(parsed_html),
      links: HTMLTags.get_anchors(parsed_html)
    }
  end

  private

  def parse_html(html)
    Nokogiri::HTML(html)
  end

  def get_html(url)
    Net::HTTP.get(URI.parse(url))
  end

  def valid_url?(uri)
    uri = URI.parse(uri)
    if uri.is_a?(URI::HTTP) && !uri.host.nil?
      true
    else
      raise 'Invalid URL'
    end
  end
end
