
def matrix
    f = File.open("./input.txt")
    data = f.read.split("\n")
    data
end 

def traverse (matrix)
    tree_count = 0
    space_count = 0
    position = 0
    matrix.each_with_index do |line, i|
        if line[position] == "#"
            tree_count +=1
            tobaggan = "X" 
        else 
            space_count +=1
            tobaggan = "O" 
        end
        if position + 3 <= (line.length) -1
            position += 3
        else
            position =  (line.length - (position + 3)).abs
        end
        line[position] = tobaggan
        p "#{line} : #{i}, #{position}"  
    end
    p "Trees: #{tree_count}"
    p "Spaces: #{space_count}"
end

matrix
traverse(matrix)