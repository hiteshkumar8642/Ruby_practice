module Function
    module ClassMethods
        def class_method
            puts "This is class method"
        end
      end
      
      def self.included(base)
        base.extend(ClassMethods)
    end
    def instance_method
        puts "This is instance method"
    end
end
class MyClass
include Function
end
a=MyClass.new
a.instance_method
MyClass.class_method