class STUDENT
    @@number_of_students=0
    @name
    @rollnumber
    def initialize(n,r)
        @name=n
        @rollnumber=r
        @@number_of_students+=1
    end
    def self.number_of_students
        @@number_of_students
    end
    def printData()
        puts "Your name #{@name}"
        puts "Your Roll Number #{@rollnumber}"
    end
end
puts "Enter your Name"
name=gets.chomp
puts "Enter your Roll number"
roll=gets.chomp
roll=roll.to_i
stud1=STUDENT.new(name,roll)
stud1.printData
puts "Total number of students #{STUDENT.number_of_students}"