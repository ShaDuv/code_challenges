
def matrix
    f = File.open("./input.txt")
    data = f.read.split("\n")
    data
end 

def traverse (matrix)
    tree_count = 0
    space_count = 0
    position = 0
    matrix.each do |line|
        line[position] == "#" ? tree_count +=1 : space_count +=1
        if position + 3 <= line.length
            position += 3
        else
            position =  (line.length - (position + 3)).abs
        end   
    end
    p "Trees: #{tree_count}."
    p "Spaces: #{space_count}."
end

matrix
traverse(matrix)