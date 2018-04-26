require 'faraday'
require 'json'
require File.join(__dir__, 'lib', 'heart_rails', 'geo_api')

geo_api = HeartRails::GeoAPI.new
# p geo_api.prefectures(:json)
# => ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "...]

# p geo_api.prefectures(:xml)
# => [#<Nokogiri::XML::Element:0x2ac78aa10cf8 name="prefecture" children=[#<Nokogiri::XML::Text:0x2ac78aa10ac8 "北海道">]>, #<Nokogiri::XML::Element:0x2ac78aa108ac name="prefecture" children=[#<Nokogiri::XML::...]

p geo_api.prefectures(:html)
# => Cannot get that request type. available types: json or xml (RuntimeError)
