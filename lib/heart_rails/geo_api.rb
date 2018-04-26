require 'faraday'
require 'json'
require 'nokogiri'

# Ref: http://geoapi.heartrails.com/api.html
module HeartRails
  class GeoAPI
    def initialize
      base_url = 'http://geoapi.heartrails.com'
      @conn = Faraday.new(url: base_url)
    end

    def prefectures(type = :json)
      fail unless [:json, :xml].include?(type)
      response =
        @conn.get("/api/#{type}") do |req|
          req.params['method'] = 'getPrefectures'
        end

      case type
      when :json
        JSON.parse(response.body)['response']['prefecture']
      when :xml
        Nokogiri::XML(response.body).css('prefecture')
      end
    end

    # def prefectures
    #   JSON.parse(prefectures.body)['response']['prefecture']
    # end
  end
end
