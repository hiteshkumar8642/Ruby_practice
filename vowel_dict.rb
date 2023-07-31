def vowel_check(**dict)
    d={}
    dict.each do |key,value|
        key=key.to_s;
        if(key.upcase=="A" ||key.upcase=="E"||key.upcase=="I"||key.upcase=="O"||key.upcase=="U")
                d[key]=value
        end
    end
    return d
end
dict={ a: "A", b: "B", c: "C", d: "D", e: "E", i: "I", f: "F"}
puts vowel_check(**dict)
