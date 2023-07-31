def odd(*arr)
    arr1=[]
    for i in (0..arr.length-1)
        num=arr[i].to_i
        if(num%2==1)
            arr1.push(num)

        end
    end
    return arr1
end
def even(*arr)
    arr1=[]
    for i in (0..arr.length-1)
        num=arr[i].to_i
        if(num%2==0)
            arr1.push(num)

        end
    end
    return arr1
end
def makebool(*arr)
    arr1=[]
    for i in (0..arr.length-1)
        num=arr[i].to_i
        arr1.push(num%2==0)
    end
    return arr1
end
def duplicate(*arr)
    freq=Hash.new(0)
    arr1=[]
    for i in (0..arr.length-1)
        num=arr[i].to_i
        freq[num]+=1
    end
    freq.each do |key, value|
        value=value.to_i
        if(value>1)
            arr1.push(key)
        end
    end 
    return arr1
end
arr=[1,2,3,3,5,8,7,2,1,10]
# arr1=odd(*arr)
# puts(arr1)
# arr1=even(*arr)
# puts(arr1)
#puts makebool(*arr)
puts duplicate(*arr)