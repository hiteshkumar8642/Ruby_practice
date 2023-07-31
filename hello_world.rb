co=begin
this is different type of print 
puts prints /n at the end and print not
p prints it in double quotes with \n
use all uppercase for constants and can be changed in between but gives a warning
global variables starts with $ 
For changing type variable .to_(type in which you want to convert)   i->integer f->float s->string sym->symbol
gets for taking input with \n \n is stored in string
gets.chomp taking input without \n

$var =10
MYNAME="hitesh kumar" 
name=gets.chomp
MYNAME="Hitesh Kumar"
p"my name is #{name}"
puts "\ahello\nTo alhappy my world \rworld"
print "Say", "hello", "to", "the", "world", "\n"
puts %q{c:\napolean's documents\the (bus) schedule.txt}

print "4".to_i
print "4.8989".to_f
print 4.91283.to_s
print "hill".to_sym

#Array 
Array1 =Array.new
puts Array1.size
puts Array1.length

Array2=Array.new(10)    #allocationg size of 10
print  Array2   # print all in one line
puts Array2 #prints one element in a line   
p Array2    #same as print
puts "#{Array2}"    #same as print
Array3=Array.new(4,"a")
Array3[0]='b'
puts Array3[0,2]
puts Array3[-2]
=end
#hash
empty_hash=Hash.new
puts empty_hash.inspect         #prints hash in a {key1 => value1,key2 => value2, ..}
puts "#{empty_hash[1]}"
hash_default = Hash.new("Codecademy") #default value for eash
puts hash_default.inspect
puts "#{hash_default[4]}"
programming_languages = {"key1" => "Ruby", "key2" => "Python", "key3" => "Java", "key4" => "C++", "key5" => "C#"}

puts programming_languages.inspect
puts programming_languages["key1"]
programming_languages["key1"] = "Ruby on Rails"
puts programming_languages["key1"]
