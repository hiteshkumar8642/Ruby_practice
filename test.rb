require 'net/http'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
url = 'https://gdmf.apple.com/v2/pmv'
uri = URI(url)
response = Net::HTTP.get(uri)
puts JSON.parse(response)
