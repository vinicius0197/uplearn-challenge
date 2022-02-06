# Webpage Fetcher

This project is part of the Software Engineer challenge for UpLearn. It implements a `fetch(url)` method which fetches the page corresponding to the url and returns an object containing the following attributes:
- assets: an array of urls present in the `<img>`  tags of the page
- links: an array of urls present in the `<a>` tags of the page

### Getting started

1. Make sure you have Ruby and Bundler installed (at least Ruby 2.6.4)
2. Install dependencies with `bundle install`

To use the function, you just need to import the `webpage.rb` file in your Ruby project and call the `fetch` method by instantiating the `Webpage` class and providing a valid URL:

```ruby
require_relative './lib/webpage'

base_url = "https://example.com/"
results = Webpage.new.fetch(base_url)
print results
```

### Assumptions
- I'm assuming that this code will be part of a larger web app. As such, the `Webpage` class encapsulates all the inner logic for parsing and extracting the `<img>` and `<a>` tags from an HTML page and exposes a neat and simple `fetch` API.
- The `Webpage` class can be easily evolved to return additional tags if necessary by implementing the corresponding getters in the `helpers/html_tags` module.

### Project organization
This project is organized into `/lib` and `/spec` subdirectories. The source code for the application is at `/lib`, while `/spec` contains all the unit tests.