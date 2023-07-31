def show_stud(stud)
    if stud.length<1
        puts "No information about the student"
        return
    end
    puts "Student Roll numbers and names\n\n"
    stud.each do |key,value|
        puts "Roll number #{key} Name: #{value} "
    end
end
def show_stud_name(stud)
    if stud.length<1
        puts "No information about the student"
        return
    end
    puts "Student names\n\n"
    stud.each do |key,value|
        puts "Name: #{value}"
    end
end
def show_stud_roll(stud)
    if stud.length<1
        puts "No information about the student"
        return
    end
    puts "Student Roll numbers\n\n"
    stud.each do |key,value|
        puts "Roll number #{key}"
    end
end
def show_total_stud(stud)
    if stud.length<1
        puts "No information about the student"
        return
    end
    puts "Total student counts #{stud.length}"
end
def add_stud(stud)
    print "Enter the student roll number\t"
    roll=gets.chomp
    roll=roll.to_i
    print "Enter the student name\t"
    name=gets.chomp
    stud[roll]=name
    puts "Student added successfully\n\n"
end
def del_stud(stud)
    print "Enter the roll number of student to be deleted\t"
    roll=gets.chomp
    roll=roll.to_i
    stud.delete(roll)
    puts "Student deleted successfully\n\n"
end
stud={}
loop{
    puts "------------Menu------------"
    puts "1.Show All students"
    puts "2.Show All student Names"
    puts "3.Show All student roll number"
    puts "4.Show Total number of students "
    puts "5.Add new Student"
    puts "6.Delete a student"
    puts "7.Exit"
    print "Enter your choice \t"
    choice =gets.chomp
    choice=choice.to_i
    
    case choice
    when 1
        show_stud(stud)
    when 2
        show_stud_name(stud)
    when 3
        show_stud_roll(stud)
    when 4
        show_total_stud(stud)
    when 5
        add_stud(stud)
    when 6
        del_stud(stud)
    when 7
        break
    else
        puts "!!!!!Invalid Input!!!!!"
    end
}