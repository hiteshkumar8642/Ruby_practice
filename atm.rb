#a=[{account no : ,name: ,DOB: ,Account type: ,Account balance: ,}]
#b=[{accountno , date ,operation,debit,credit,Amount balance}]
require 'time'

a=[]
b=[]


def create_acc(a,b)
    hash1={}
    hash2={}
    print "Enter the account number\t"
    hash1["Account_id"]=gets.chomp
    print "Enter the name\t"
    hash1["Name"]=gets.chomp
    print "Enter the DOB\t"
    hash1["DOB"]=gets.chomp
    print "Enter Account type\t"
    hash1["Account_type"]=gets.chomp
    print "Enter Account Balance\t"
    hash1["Account_balance"]=gets.chomp.to_i
    
    hash2["Account_id"]=hash1["Account_id"]
    hash2["Date"]=Time.now.strftime("%d/%m/%Y %H:%M")
    hash2["Operation"]="ACCOUNT CREATED"
    hash2["Debit"]="--"
    hash2["Credit"]="--"
    hash2["Account_balance"]=hash1["Account_balance"].to_i
    a.push(hash1)
    b.push(hash2)
    puts"\n\nAccount Created Successfully"
end


def print_details(a)
    a.each do |dict|
        dict.each do |key,value|
            puts "#{key} => #{value}"
        end
    end
end
    

def deposit_money(a,b)
    hash2={}
    print "Enter the account number\t"
    account_id=gets.chomp
    print "Enter the Ammount of money you want to deposit\n"
    money=gets.chomp.to_i

    hash2["Account_id"]=account_id
    hash2["Date"]=Time.now.strftime("%d/%m/%Y %H:%M")
    hash2["Operation"]="DEPOSITED"
    hash2["Debit"]="-"
    hash2["Credit"]=money.to_s
    bal=0
    a.each do |row|
        if row["Account_id"] == account_id
            row["Account_balance"]=row["Account_balance"]+money
            bal=row["Account_balance"]
        end
    end
    hash2["Account_balance"]=bal
    b.push(hash2)
    puts"\n\nMoney Deposited Successfully"
end


def withdraw_money(a,b)
    hash2={}
    print "Enter the account number\t"
    account_id=gets.chomp
    print "Enter the Ammount of money you want to withdraw\n"
    money=gets.chomp.to_i

    hash2["Account_id"]=account_id
    hash2["Date"]=Time.now.strftime("%d/%m/%Y %H:%M")
    hash2["Operation"]="WITHDRAW"
    hash2["Debit"]=money.to_s
    hash2["Credit"]="-"
    bal=0
    a.each do |row|
        if row["Account_id"] == account_id
            row["Account_balance"]=row["Account_balance"]-money
            bal=row["Account_balance"]
        end
    end
    hash2["Account_balance"]=bal
    b.push(hash2)
    puts"\n\nMoney Debited Successfully"
end


def view_balance(a)
    print "Enter the account number\t"
    account_id=gets.chomp
    a.each do |row|
        if row["Account_id"] == account_id
            puts "\n\nYour account balance is => #{row["Account_balance"]}"
        end
    end
end


def print_stmt(b)
    print "Enter the account number\t"
    account_id=gets.chomp
    puts "\n\nDate\t\t\tOperation\tCredit\tDebit\tAccount Balance\n"
    b.each do |row|
        if row["Account_id"] == account_id
            puts "#{row["Date"]}\t#{row["Operation"]}\t#{row["Credit"]}\t#{row["Debit"]}\t#{row["Account_balance"]}"
        end
    end
end


loop{
    system("clear")
    puts "------------Menu------------"
    puts "1.Create New Account"
    puts "2.Print Account Details"
    puts "3.Deposit Money"
    puts "4.Withdraw Money"
    puts "5.View Account Balance"
    puts "6.Print Account Statment"
    puts "7.Exit"
    print "Enter your choice \t"
    choice =gets.chomp
    system("clear")
    choice=choice.to_i
    case choice
    when 1
        create_acc(a,b)
    when 2
        print_details(a)
    when 3
        deposit_money(a,b)
    when 4
        withdraw_money(a,b)
    when 5
        view_balance(a)
    when 6
        print_stmt(b)
    when 7
        break
    else
        puts "!!!!!Invalid Input!!!!!"
    end
    print"\n\n\nHit Enter to continue..."
    gets
    
}