# Webpage Fetcher

This project is part of the Software Engineer challenge for UpLearn. It implements a `fetch(url)` method which fetches the page corresponding to the url and returns an object containing the following attributes:
- assets: an array of urls present in the `<img>`  tags of the page
- links: an array of urls present in the `<a>` tags of the page

### Getting started

To use the function, you just need to import the `webpage.rb` file in your Ruby project and call the `fetch` method by providing a valid URL:

```ruby
require './lib/webpage'

base_url = "https://example.com/"
results = Webpage.fetch(base_url)
print results
```

### Assumptions


### Project organization
This project is organized into `/lib` and `/spec` subdirectories. The source code for the application is at `/lib`, while `/spec` contains all the unit tests.