=begin
 loop execution control statements
 redo starts the loop from begining
 retry again try the same iteration
 next   skip the current iteration
 break break the whole loop
=end
i = 2
num = 5

while i < num  do
   puts("Inside the while loop i = #{i}" )
   i +=1
end
i=2
begin
    puts("Inside the modified while loop i=#{i}")
    i=i+1
end while i<num

i = 2
until i > num  do
    puts("Inside the until  loop i = #{i}" )
    i +=1
 end
 
 i=2
 begin
     puts("Inside the modified until loop i=#{i}")
     i=i+1
 end until i>num

 for i in 0..5
    puts "Inside for loop i=#{i}"
 end

 (0..5).each do |i|
    puts "Inside for modified For loop i=#{i}"
 end
 