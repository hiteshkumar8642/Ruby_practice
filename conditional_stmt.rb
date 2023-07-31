#one liner if statment
x=3
if x == 3 then puts "x is 3" end
puts "x is NOT 3" unless x == 3
puts "x is 3" if x == 3
#if else  statements
age = 17
if(age>=18)
    puts "You are good for driving"
else
    puts "You are not good for driving"

end

#else if statements
age1 = 35
age2 = 26
age3 = 19
age4 = 17
age5 = 15

def things_you_can_do(age)
  if (age >= 35)
    puts "You can run for president."
  elsif (age >= 25)
    puts "You can rent a car."
  elsif (age >= 18)
    puts "You can vote."
  elsif (age >= 16)
    puts "You can get a driver's license."
  else
    puts "You still have your youth!"
  end
end

things_you_can_do age1
things_you_can_do age2
things_you_can_do age3
things_you_can_do age4
things_you_can_do age5

#ternary operator
age1 = 19
can_vote = (age1 >= 18) ? "You can vote." : "You can't vote."
puts can_vote

a = 5
case a
when 5
    "a is 5"
when 6
    "a is 6"
else
    "a is neither 5, nor 6"
end
