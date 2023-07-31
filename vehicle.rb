class Vehicle
    attr_accessor :name,:type 

    def initialize(name,type)
        @name=name
        @type=type
        @wheels = 4
    end

    def self.details
        puts "this is class method"
    end

    def wheels
        @wheels
    end

    def wheels=(wheels)
        @wheels = wheels
    end
    
end
c1=Vehicle.new("alto","k10")
c1.name="bmw"
Vehicle.details
p c1.wheels
c1.wheels= 2
p c1.wheels
