
a=[1,2,"hii"]
print a
print"\n"
#nested array
matrix=[[1,2,3],[4,5,6],[7,8,9]]
print matrix[0] 
print"\n"
print matrix[1] 
print"\n"
print matrix[2] 
print"\n"
#array of Hashes
stud=[{roll: 14,name:"hitesh",age:21},{roll: 69,name: "Happy",age:10}]
puts stud
#some common array method
a=[1,2,3,4,5,6,7,8,9,10]
#include is like a find function find element in an array and return true is it is present
puts a.include?10
# flattens method create a 1D matrix from a 2D matrix
print matrix.flatten
#uniq function return an array of unique elements  by removing all duplicate elements
b=[1,2,3,4,2,5,7,1,7,4,2,8,9,3,0,6,5,9]
print b.uniq
print "\n"
#by adding ! at the end of uniq and sort  function we can make the changes permanent in the original array
print b.sort!
print "\n"
print b
print "\n"
#hashes starting it is a key value type data structure always start and ends with{}
hash1 ={a: 1,b: 2}
hash2 ={c: 3,d: 4}
#merge function merge two hash and ! makes it permanentin first array
puts hash1.merge!(hash2)
puts hash1
#to delete a key value from hash we use delete(key)
hash1.delete(:c)
puts hash1

