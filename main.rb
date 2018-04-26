require 'faraday'
require 'json'
require File.join(__dir__, 'lib', 'heart_rails', 'geo_api')

geo_api = HeartRails::GeoAPI.new
p geo_api.prefectures(:xml)
