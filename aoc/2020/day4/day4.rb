def run
    output = passport_data(data)
    validate(output)
end

def data
    raw_data = []
    f = File.open("./input.txt")
    data = f.read.split(/\n{2,}/)
    data.each do |line|
        raw_data.push(line.split())
    end
    raw_data
end

def passport_data(data)
    passports = []
    data.each do |passport|
        hash = {}
        passport.each do |pair|
            set = pair.split(":")
            hash[set[0].to_sym] = set[1]
        end
        passports.push(hash)
    end 
    passports
end   

def validate(passport_data)
    required_fields = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, ]
    valid = 0
    passport_data.each do |passport|
       p check = required_fields - passport.keys
       if check.empty?
        valid +=1
       end
    end
    p valid
end

run