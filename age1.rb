puts "How old are you"
age=gets.chomp
age=age.to_i
puts "In 10 years you will be #{age+10}"
puts "In 20 years you will be #{age+20}"
puts "In 30 years you will be #{age+30}"
puts "In 40 years you will be #{age+40}"
for i in 1..5 do 
    puts "In #{i*10} years you will be #{age+i*10}"
end