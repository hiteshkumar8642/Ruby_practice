def modify(*str)
    mod_str=""
    for i in (0..str.length)
        word=str[i].to_s
        word=word.dup
        word.chomp!
        word.strip!
        mod_str+=word
        mod_str+=" "
    end
    return mod_str;
end

str=["a \n","b  \t\t\r","c"]
mod_str=modify(*str)
puts mod_str