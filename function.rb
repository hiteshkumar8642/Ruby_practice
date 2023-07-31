=begin
function defination
def method_name

end

we can use puts as variable as well as function name at the same time

print =10
puts print
puts=9
p puts
puts " hii"


def myfunc(name="Hitesh")
    puts name
end

myfunc()
myfunc("Happy")

#we have variable parameter *var_name  represent array and **var name represent hash

def say(*words)
    puts words
end
name=["a","b","c"]
say(name)
say(["a","s","d"])
say("z","x","c")
**word argument should be at last only

def say(**words)
    puts words
end
capital={"a" => "A"}
say(**capital)

Required keyword use argument as symbol and can be called in order in function call


def stud(name:,roll:14)
    puts name
    puts roll
end
stud(name: "hitesh",roll: 14)
stud(roll: 14,name: "hitesh")
stud(name: "hitesh")

priority required > default>variable>keyword
=end
