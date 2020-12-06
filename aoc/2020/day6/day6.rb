f = File.open("./input.txt")
data = f.read.split(/\n{2,}/)

def run (data)
   p "Total for test one is #{one(data)}"
   p "Total for test two is #{all(data)}"
end

def one(data)
    total = 0
    data.each do |x|
    letters = x.tr("\n", "").split("")
    total += letters.uniq.count
    end
    total
end

def all(data)
    total = 0
    data.each do |x|
        persons = x.split("\n")
        count = persons.count
        key = x.split("").uniq
            key.each do |k|
                if x.count(k) == count
                    total += 1
                end
            
            end
    end
    total
end

run(data)
