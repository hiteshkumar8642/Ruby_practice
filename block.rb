=begin
block are enclosed in {}
|argument name|

=end
["hii","how","are","you","all"].each {|num| puts num}
# here |num | is block argument and puts num is block body
#Pass a block to a method

def myblock1(&block)
    block.call
end
#yeild keyword is used to use the block associated with it
def myblock()
    yield
end
#two methods of defining my block using curly braces and do/end
myblock {
    puts "Inside my block"
}
myblock1 do
    puts "Inside my block1"
end
#passing arguments to yeild it ignores the extra arguments
def one_two_three
    yield 1, 2
    #yield 2
end
one_two_three { |number| puts number * 10 }
  
#yeild without block will give error block_given method will return true if block exist
def noblock()
    if (block_given?)
        yield
    end
end
noblock()




