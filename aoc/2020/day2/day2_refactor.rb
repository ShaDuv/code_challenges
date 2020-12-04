data = 
unit = data.split(" ")
numbers = set[0].split[0]
position1 = (numbers.split("-")[0].to_i) -1
position2 = (numbers.split("-")[1].to_i) -1
letter = set[1].split('')[0]
password = set[2]

def run
    parse_text
    p "First result is #{validate_1(parse_text)}!"
    p "Second result is #{validate_2(parse_text)}!"
end

def parse_text
    f = File.open("./input.txt")
    data = f.read.split("\n")
end


def validate_1(data)
    valid = 0
    if password.count(letter).between?(position1, position2)
        valid +=1
    end
end
    valid
end

def validate_2(data)
    valid = 0
    data.each do |unit|
        unless password[position1] == password[position2]
            if password[position1] == letter  || password[position2] == letter
                valid +=1
            end
        end
    end
    valid

end

run