require 'faraday'
require 'json'
require 'nokogiri'

# Ref: http://geoapi.heartrails.com/api.html
module HeartRails
  class GeoAPI
    def initialize
      base_url = 'http://geoapi.heartrails.com'
      @faraday = Faraday.new(url: base_url)
    end

    def prefectures(request_type = :json)
      response =
        @faraday.get("/api/#{request_type}") do |req|
          req.params['method'] = 'getPrefectures'
        end

      {
        json: proc { |body| JSON.parse(body)['response']['prefecture'] },
        xml:  proc { |body| Nokogiri::XML(body).css('prefecture') }
      }[request_type].call(response.body)
    rescue NoMethodError => _e
      'Cannot get a data for that request type. available types is: json or xml'
    end
  end
end
