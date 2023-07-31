#modules can are collection of var ,method, but can not have objects
module Test
    C=1092
    def fly()
        puts "i can fly"
    end
end

include Test

Test.fly
