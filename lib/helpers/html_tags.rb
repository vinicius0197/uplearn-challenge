require 'nokogiri'

# Helper functions for extracting tags from parsed HTML source
module HTMLTags
  def self.get_imgs(doc)
    doc.css('img').map { |i| i['src'] }.compact
  end

  def self.get_anchors(doc)
    doc.css('a').map { |i| i['href'] }.compact
  end
end