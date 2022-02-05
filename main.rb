require './lib/webpage'

base_url = 'https://example.com/'
results = Webpage.new.fetch(base_url)
print results
