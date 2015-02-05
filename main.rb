require 'faraday'
require 'json'

# Ref: http://geoapi.heartrails.com/api.html
class GeoAPI
  def initialize
    base_url = 'http://geoapi.heartrails.com'
    @conn = Faraday.new(url: base_url)
  end

  def prefectures(type = :json)
    fail unless [:json, :xml].include?(type)
    @conn.get("/api/#{type}") do |req|
      req.params['method'] = 'getPrefectures'
    end
  end

  def parsed_prefectures
    JSON.parse(prefectures.body)['response']['prefecture']
  end
end

g = GeoAPI.new
p g.parsed_prefectures
