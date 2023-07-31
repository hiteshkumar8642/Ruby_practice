module Flyable
    def fly
        puts "I Can Fly"
    end
end
module Smashable
    def smash
        puts "I Can Smash"
    end
end

class SuperHero
    
    def fight
        puts "I will save you all"
    end
end

class CaptianAmerica < SuperHero
include Flyable
    
end

class IronMan < SuperHero
    include Flyable
    
end

class Hulk < SuperHero
include Smashable
    def method_missing(input)
        if input.to_s == "fly"
            puts "Hulk cannot fly"
        else
            puts "#{input} Method not present"
        end
    end
end
ca1=CaptianAmerica.new
ca1.fight
ca1.fly
h1=Hulk.new
h1.fight
h1.fly
h1.smash

