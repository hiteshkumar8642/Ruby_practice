def add_ele(a)
    print "Enter the element to insert\t"
    ele=gets.chomp
    ele=ele.to_i
    a << ele
    puts "Element sucessfully inserted"
    return a
end
def del_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    a.pop
    puts "Element sucessfully deleted"
    return a
end
def max_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    max=a[0]
    max=max.to_i
    a.each do |num|
        num=num.to_i
        if(max<num)
            max=num
        end
    end
    puts "The maximum element of the array is #{max}"
end    
def min_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    min=a[0]
    min=min.to_i
    a.each do |num|
        num=num.to_i
        if(min>num)
            min=num
        end
    end
    puts "The minimum element of the array is #{min}"
end    
def sum_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    sum=0
    a.each do |num|
        num=num.to_i
        sum+=num
    end
    puts "The sum of elements of the array is #{sum}"
end   
def avg_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    sum=0
    a.each do |num|
        num=num.to_i
        sum+=num
    end
    puts "The averege of elements of the array is #{sum.to_f/a.length.to_f}"
end   
def rev_ele(a)
    if(a.length==0)
        puts "No elements present in the array"
        return
    end
    for i in (0..a.length/2-1)
        temp=a[a.length-1-i]
        a[a.length-1-i]=a[i]
        a[i]=temp
    end
    puts "The array is reversed"
end  
a=[]
loop{
    puts "------------Menu------------"
    puts "1.Add new element to array"
    puts "2.Remove last element from array"
    puts "3.Find maximum element"
    puts "4.Find Minimum element "
    puts "5.Find Sum of all elements"
    puts "6.Find Averege of all elements"
    puts "7.Reverse the array"
    puts "8.Print the array"
    puts "9.Exit"
    print "Enter your choice \t"
    choice =gets.chomp
    choice=choice.to_i
    
    case choice
    when 1
        add_ele(a)
    when 2
        del_ele(a)
    when 3
        max_ele(a)
    when 4
        min_ele(a)
    when 5
        sum_ele(a)
    when 6
        avg_ele(a)
    when 7
        rev_ele(a)
    when 8
        print a
        print "\n"
    when 9
        break
    else
        puts "!!!!!Invalid Input!!!!!"
    end
}