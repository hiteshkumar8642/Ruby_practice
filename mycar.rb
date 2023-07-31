class MyCar
    @@year
    @@color
    @@model
    @@current_speed
    
    def initialize(y,c,m)
        @@year=y
        @@color=c 
        @@model=m 
        @@current_speed=0
    end
    
    def show()
        puts "Year purchased #{@@year}"
        puts "Your car colour #{@@color}"
        puts "Your car model #{@@model}"
        puts "Your speed #{@@current_speed}"
    end

    def speedup()
        @@current_speed+=10 
        puts "Your current speed is #{@@current_speed}"
    end
    def view_modify_color()
        puts "Your car colour #{@@color}"
        puts "Do you want to change color of the car \nHit enter to skip or write the color"
        col=gets.chomp
        if(col.length>0)
            @@color=col
        end
    end

    def view_year()
        puts "Year purchased #{@@year}"
    end

    def brake()
        if(@@current_speed==0)
            puts "Your car is not moving speed up for fun"
            return
        end
        @@current_speed-=10
        puts "Your current speed is #{@@current_speed}"
    end
    
    def stop()
        @@current_speed=0
        puts "Your car is stopped"
    end
end
alto=MyCar.new(2022,"black","K10")
alto.show
alto.speedup
alto.brake
alto.brake
alto.stop
alto.view_modify_color
alto.view_color

