class Vehicle
    @@number_of_vehicle=0
    def self.number_of_vehicle
        @@number_of_vehicle
    end
end

class MyCar < Vehicle
    
    NUMBER_OF_DOOR=4
    
    def initialize()
        @@number_of_vehicle += 1
    end
    
    def self.number_of_door
        NUMBER_OF_DOOR 
    end
end

class MyTruck < Vehicle
    
    NUMBER_OF_DOOR=2
    
    def initialize()
        @@number_of_vehicle+=1
    end
    
    def self.number_of_door
        NUMBER_OF_DOOR 
    end
end
alto=MyCar.new()
puts MyCar.number_of_door
puts Vehicle.number_of_vehicle