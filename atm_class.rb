class Transaction
    @date
    @operation
    @debit
    @credit
    @balance
    def initialize(oper,deb,cred,balance)
        @date=Time.now.strftime("%d/%m/%Y %H:%M")
        @operation=oper
        @debit=deb
        @credit=cred
        @balance=balance
    end
    def show()
        puts "#{@date}\t#{@operation}\t#{@debit}\t#{@credit}\t#{@balance}"
    end

end
class Account
    @account_id
    @name
    @dob 
    @account_type 
    @balance
    @transactions
    def initialize(account_id,name,dob,account_type,balance)
        @account_id=account_id
        @name=name
        @dob=dob
        @account_type=account_type
        @balance=balance
        
        @transactions = Array.new
        add_transaction("ACCOUNT CREATED","-","-",@balance)
    end
    def add_transaction(oper,deb,cred,balance)
        @transactions << Transaction.new(oper,deb,cred,balance)        
    end
    def show_transaction()
        puts "\n\nDate\t\t\tOperation\tCredit\tDebit\tAccount Balance\n"
        @transactions.each do |t|
            t.show
        end
    end
    def withdraw()
        print "Enter the Ammount of money you want to withdraw\n"
        money=gets.chomp.to_i
        @balance-=money
        add_transaction("WITHDRAW","-",money.to_s,@balance)
    end
    def deposit()
        print "Enter the Ammount of money you want to deposit\n"
        money=gets.chomp.to_i
        @balance+=money
        add_transaction("DEPOSITED",money.to_s,"-",@balance)
    end
    
    def get_balance
        @balance
    end
    
    def get_account_id
        @account_id
    end
    
    def view_details
        puts "Your Name => #{@name}"
        puts "Your Date of Birth => #{@dob}"
        puts "Your Account type => #{@account_type}"
        puts "Your Balance => #{@balance}"
    end
end
accounts=[]
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
        print "Enter the account number\t"
        account_id=gets.chomp
        print "Enter the name\t"
        name=gets.chomp
        print "Enter the DOB\t"
        dob=gets.chomp
        print "Enter Account type\t"
        account_type=gets.chomp
        print "Enter Account Balance\t"
        balance=gets.chomp.to_i
        accounts << Account.new(account_id,name,dob,account_type,balance)
        puts "\n\nAccount Created successfully\n"
    when 2
        print "\nEnter Account number\t"
        id=gets.chomp
        accounts.each do |a|
            if a.get_account_id==id
                a.view_details
            end
        end
    when 3
        print "\nEnter Account number\t"
        id=gets.chomp
        accounts.each do |a|
            if a.get_account_id==id
                a.deposit
            end
        end
        puts"\nMoney debited \n"
    when 4
        print "\nEnter Account number\t"
        id=gets.chomp
        accounts.each do |a|
            if a.get_account_id==id
                a.withdraw
            end
        end
        puts"\nMoney credited \n"
    when 5
        print "\nEnter Account number\t"
        id=gets.chomp
        accounts.each do |a|
            if a.get_account_id==id
                puts "Your account balance is #{a.get_balance}"
            end
        end
    when 6
        print "\nEnter Account number\t"
        id=gets.chomp
        accounts.each do |a|
            if a.get_account_id==id
                a.show_transaction
            end
        end
    when 7
        break
    else
        puts "!!!!!Invalid Input!!!!!"
    end
    print"\n\n\nHit Enter to continue..."
    gets
    
}    
