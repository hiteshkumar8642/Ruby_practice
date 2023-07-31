#proc are function made using proc stored in variable
name=Proc.new{puts "My name is Hitesh Kumar"}
name.call 
number =Proc.new do|num|
    puts "#{num} is given in this proc"
end
number.call(20)
def proctaker(proc)
    proc.call 89
end
proctaker(number)

#lambda they are simillar to proc but made directlyusing var_name =-> {}
my_lambda=->{puts "Ho gya call"}
#different methods to call lambda
my_lambda.call
my_lambda.()
my_lambda[]
my_lambda.===

#lambda with arguments
square=->(x){x**2}
puts square.call(2)
#proc will return from method and lambda will from lambda vody only