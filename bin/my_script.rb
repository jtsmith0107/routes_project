require 'rest-client'
require 'addressable/uri'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares/1/favorite'
).to_s

puts RestClient.get(url)
# puts RestClient.post(url, :user => {name: "Duffy", email: "duck@bob.com" } )