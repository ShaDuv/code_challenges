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
    required_fields = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid ]
    valid_colors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    valid = 0
    passport_data.each do |passport|
        check = required_fields - passport.keys
       if check.empty?
         byr = passport.fetch(:byr).to_i.between?(1920, 2002) 
         iyr = passport.fetch(:iyr).to_i.between?(2010, 2020)
         eyr = passport.fetch(:eyr).to_i.between?(2020, 2030)
         pid = passport.fetch(:pid).length == 9
         ecl = valid_colors.include?(passport.fetch(:ecl))
         hcl1 = passport.fetch(:hcl).length == 7 && 
         hcl2 = passport.fetch(:hcl)[0] == "#"
         hcl3 = !passport.fetch(:hcl)[1..-1][/\H/]
         hgt1 = passport.fetch(:hgt)[-2..-1] == "cm"
         hgt2 = passport.fetch(:hgt)[-2..-1] == "in"
         hgt_for_cm = passport.fetch(:hgt)[0...-2].to_i.between?(150, 193)
         hgt_for_in = passport.fetch(:hgt)[0...-2].to_i.between?(59, 76)

         if byr && iyr && eyr
           if pid
            if ecl
                if hcl1 && hcl2 && hcl3
                    if hgt1 && hgt_for_cm || hgt2 && hgt_for_in
                        valid +=1
                    end 
                end
            end
           end
         end
       end
    end
    p "There are #{valid} passports."
end

run