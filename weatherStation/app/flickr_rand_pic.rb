require 'rest-client'
require 'flickr.rb'
#nsid = RestClient.get 'http://api.flickr.com/services/rest/?method=flickr.people.findByUserName&api_key=3a86e2e6e0552b135fa3830f8421d07e&username=cycledefrance'
nsid = (JSON.parse RestClient.get 'https://api.flickr.com/services/rest/?method=flickr.people.findByUsername&api_key=2b1d1f61fac0bf20fba63a9d7d8b0415&username=cycledefrance&format=json&nojsoncallback=1&auth_token=72157663924203265-dc94bea669d9d2a7&api_sig=c1d45abf9bb161f42b3bd51b767301e7')['user']['id']
puts nsid
result = RestClient.get "https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&name=value&format=json&api_key=3a86e2e6e0552b135fa3830f8421d07e&user_id=#{nsid}"
puts result
