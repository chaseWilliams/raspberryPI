require 'rest-client'

module Flickrd
  def imgUrl photo_id
    response = JSON.parse (RestClient.get "https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=3a86e2e6e0552b135fa3830f8421d07e&format=json&photo_id=#{photo_id}&nojsoncallback=?")
    puts response.class
    response.each {|k| puts k.class}
    puts response[0].class
    img_index = nil
    response['sizes']['size'].each_with_index {|k, i| if k['label'] == 'Large' then img_index = i; break end}
    #response.each
    #rescue plan
    if img_index.nil?
      return "https://farm7.staticflickr.com/6217/6357276861_1fdc6fe3d4_b.jpg"
    else
      return response['sizes']['size'][img_index]['source']
    end
  end
  module_function :imgUrl
end
puts Flickrd.instance_methods
