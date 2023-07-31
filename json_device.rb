require 'net/http'          #for geting data from link
require 'json'              #for managing json data
require 'openssl'           #for certificate error
require 'naturally'         #for sorting all the versions
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE       #Use when ruby is not able to find root certificate and giving ssl error 

#All classes

class Device
    
    def initialize(name)
        @device_name=name
    end
    
    
    def get_name
        @device_name
    end

end

class Product
    
    def initialize(productVersion,postingDate,expirationDate)
        @productVersion=productVersion
        @postingDate=postingDate
        @expirationDate=expirationDate
        @supportedDevices=Array.new
    end
    
    
    def add_device(device)
        @supportedDevices.push(Device.new(device))
    end
    
    
    def hasSupportedDevice(name)
        @supportedDevices.each do |device|
            if device.get_name == name.to_sym
                return true
            end
        end
        return false
    end
    
    
    def getVersion
        @productVersion
    end
    
    
    def print
        puts "\nProduct Version : #{@productVersion}"
        puts "Product Posting Date  : #{@postingDate}"
        puts "Product Expiration Date : #{@expirationDate}\n"
    end

end

class Platform
    
    def initialize(name)
        @platform_name=name
        @products=Array.new
    end
    
    
    def add_product(product)
        @products << product
    end
    
    
    def get_name
        @platform_name
    end
    
    
    def hasSupportedDevice(name)
        @products.each do |prod|
            if prod.hasSupportedDevice(name)
                prod.print 
            end
        end
    end
    
    
    def getAllVersion(name)
        platformVersion=Array.new
        @products.each do |prod|
            platformVersion << prod.getVersion
        end
        puts "#{name} Updates Ascending Order"
        puts Naturally.sort(platformVersion) 
        puts "#{name} Updates Descending Order"
        puts Naturally.sort(platformVersion).reverse 
    end

    
    def print
        puts "Name is : #{@platform_name} with total #{@products.length}"    
    end
end
class PublicAssetSet
    
    def initialize()
        @platforms=Array.new
    end
    
    
    def add_platform(platform)
        @platforms << platform
    end
    
    
    def findDevice(name)
        @platforms.each do |platform|
            platform.hasSupportedDevice(name)
        end
    end
    
    
    def getAllVersion(name)

        @platforms.each do |platform|
            if platform.get_name == name.to_sym
                platform.getAllVersion(name)
            end 
        end
    end
    
end

class AssetSet
    
    def initialize()
        @platforms=Array.new
    end
    
    
    def add_platform(platform)
        @platforms << platform
    end
    
    
    def findDevice(name)
        @platforms.each do |platform|
            platform.hasSupportedDevice(name)
        end
    end
    
    
    def getAllVersion(name)
        @platforms.each do |platform|
            if platform.get_name == name.to_sym
                platform.getAllVersion(name)
            end 
        end
    end
    
end

class PublicRapidSecurityResponses
    
    def initialize()
        @platforms=Array.new
    end
    
    
    def add_platform(platform)
        @platforms << platform
    end
    
    
    def findDevice(name)
        @platforms.each do |platform|
            platform.hasSupportedDevice(name)
        end
    end
    
    
    def getAllVersion(name)
        @platforms.each do |platform|
            if platform.get_name == name.to_sym
                platform.getAllVersion(name)
            end 
        end
    end
    
end

#fetching data from link

url = 'https://gdmf.apple.com/v2/pmv'       
uri = URI(url)
response = Net::HTTP.get(uri)
data_hash=JSON.parse(response,{:symbolize_names => true})


#objects of Set classes
pas=PublicAssetSet.new()
as=AssetSet.new()
prsr=PublicRapidSecurityResponses.new()


#fetching data and creating objects
data_hash.each do |key ,value|
    type=key
    value.each do |key,value|
        platform=Platform.new(key)
        value.each do |prod|
            product=Product.new(prod[:ProductVersion],prod[:PostingDate],prod[:ExpirationDate])
            prod[:SupportedDevices].each do |device| 
                product.add_device(device.to_sym)
            end
            platform.add_product(product)
        end

        if type == "PublicAssetSets".to_sym
            pas.add_platform(platform)
        elsif type == "AssetSets".to_sym
            as.add_platform(platform)
        else
            prsr.add_platform(platform)
        end
    end
end


#getting device and showing all supported versions
puts "Enter the device name "
device_name=gets.chomp
puts "\n\nPublicAssetSets\n\n"
puts "------------------------------------"
pas.findDevice(device_name)
puts "------------------------------------"
puts "\n\nAssetSets\n\n"
puts "------------------------------------"
as.findDevice(device_name)
puts "------------------------------------"
puts "\n\nPublicRapidSecurityResponses\n\n"
puts "------------------------------------"
prsr.findDevice(device_name)


puts "\n\nAll versions Of all sets\n\n"

#taking platform name and showing all available versions

puts "------------------------------------"
puts "\n\nPublicAssetSets\n\n" 
puts "------------------------------------"
pas.getAllVersion("iOS")
pas.getAllVersion("macOS")
puts "------------------------------------"
puts "\n\nAssetSets\n\n"
puts "------------------------------------"
as.getAllVersion("iOS")
as.getAllVersion("macOS")
puts "------------------------------------"
puts "\n\nPublicRapidSecurityResponses\n\n"
puts "------------------------------------"
prsr.getAllVersion("iOS")
prsr.getAllVersion("macOS")