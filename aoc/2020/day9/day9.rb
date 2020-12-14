f = File.open("./input.txt")
data = f.read.split("\n")

def search(data)
    i = 6
    while i < data.length do
        sum =  data[i].to_i
        preamble = data[(i - 25)..i]
        false_count = 0
            preamble.each do |x|
                other_number = sum - x.to_i
                unless preamble.any?(other_number.to_s)
                    false_count +=1
                    return sum if false_count == 25
                end
            end
        i+=1
    end
end

def sliding_window (data, search)
    target = search.to_i
    min = 0
    total = data[min].to_i
    start = 0
    finish = 0
    
    until total == target
        min +=1
        max = min
        total = data[min].to_i
       while total < target
            max +=1
           total += data[max].to_i
        end 
        start = min
        finish = max
    end
    range = data[start, (finish - start)]
    p range.max.to_i + range.min.to_i

    # data[data[min]..data[max]]each do |n|
    #     a.push(n)
    # end
    # p a
end


# p search(data)
sliding_window(data, search(data))