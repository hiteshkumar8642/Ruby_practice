require 'net/http'
require 'json'
require 'openssl'
require 'naturally'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE       #Use when ruby is not able to find root certificate and giving ssl error 
system('clear')
url = 'https://gdmf.apple.com/v2/pmv'       
uri = URI(url)
response = Net::HTTP.get(uri)
data_hash=JSON.parse(response)
macOS_updates=[]
iOS_updates=[]
all_update=[]
puts "Enter the device name "
device_name="iPhone13,2"
data_hash.each do |key ,value|
    value.each do |key,value|
        value.each do |num|
            if  key=="macOS"
                macOS_updates.push(num["ProductVersion"].to_s)
            else
                iOS_updates.push(num["ProductVersion"].to_s)
            end
            all_update.push(num["ProductVersion"].to_s)
            if num["SupportedDevices"].include? device_name
                puts "\nProduct Version : #{num["ProductVersion"]}"
                puts "Product Posting Date  : #{num["ProductVersion"]}"
                puts "Product Expiration Date : #{num["ExpirationDate"]}\n"
            end
        end
    end
end
# puts "macOS Updates Ascending Order"
# puts Naturally.sort(macOS_updates) 
# puts "macOS Updates Descending Order"
# puts Naturally.sort(macOS_updates).reverse  
# puts "iOS Updates Ascending Order"
# puts Naturally.sort(iOS_updates) 
# puts "iOS Updates Descending Order"
# puts Naturally.sort(iOS_updates).reverse 
all_update.uniq!
puts iOS_updates.uniq.length+macOS_updates.uniq.length