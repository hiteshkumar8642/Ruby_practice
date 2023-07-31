#ruby hook methods used to extend functionality
#include print or generate a comment when included in a class the module will become the superclass of the current class and all the functions are accessible
module Mymodule
    def self.included(name)
        puts "HI #{name}"
    end
end
class Fish
    include Mymodule
end


#the module will become the subclass of the current class and all the functions are accessible
#perpend  hook this is used to make module methods to instance method and will override the module method if present in class
module Mymodule1  
    def self.prepended(target)    #prepend method
      puts "#{self} #{target}"
    end
   
    def Example
      "Example for Prepend"
    end
end
   
class Happy
    prepend Mymodule1    #Coding module is prepended
    
    def Example
        "Example for Prepend1"
    end
end
   
puts Happy.new.Example    #calling the method 






#extend  hook this is used to make module methods to class methods
module Coding
    def self.extended(target)
      puts "#{self} #{target}"
    end
   
    def Example
      "This is Example"
    end
  end
   
  class Ninjas
    extend Coding
      #Coding module is extended
  end
   
  puts Ninjas.Example   #calling method







# inherited is used  when a subclass of a class is implemented
class Food    #parent class
    def self.inherited(food_type)
      puts "#{food_type} is a kind of Food"
    end
  end
   
  class Continental<Food #Inhereting the Food class
  end


#method missing this is used when we want to handle the function which are not there for any object  

class Fish

    def method_missing(input)
        puts "#{input} is not present"
    end
end

f1=Fish.new
f1.walk

#regex commands
# start of the line: ^
# end of the line: $
# start of the string: \A
# end of the string: \z