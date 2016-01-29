require 'rest-client'
require 'flickr.rb'

module Flickr
    def imgUrl photo_id
        response = JSON.parse RestClient.get "https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=3a86e2e6e0552b135fa3830f8421d07e&format=json&photo_id=#{photo_id}"
        