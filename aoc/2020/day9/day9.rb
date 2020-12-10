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

p search(data)