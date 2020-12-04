
def matrix
    f = File.open("./input.txt")
    data = f.read.split("\n")
    data
end 

def traverse (matrix, move, column)
    tree_count = 0
    space_count = 0
    position = 0
    move = move

    matrix.each_with_index do |line, i|
      if i % column == 0
        if line[position] == "#"
            tree_count +=1
            tobaggan = "X" 
        else 
            space_count +=1
            tobaggan = "O" 
        end
        if position + move <= (line.length) -1
            position += move
        else
            position =  (line.length - (position + move)).abs
        end
        line[position] = tobaggan
        #p "#{line} : #{i}, #{position}"  
        end
    end
    tree_count
   
end

matrix
total = traverse(matrix, 1, 1) * traverse(matrix, 3, 1) * traverse(matrix, 5, 1) * traverse(matrix, 7, 1) * traverse(matrix, 1, 2)

p "Tree count for 1 x 1 is #{traverse(matrix, 1, 1)}."
p "Tree count for 3 x 1 is #{traverse(matrix, 3, 1)}."
p "Tree count for 5 x 1 is #{traverse(matrix, 5, 1)}."
p "Tree count for 7 x 1 is #{traverse(matrix, 7, 1)}."
p "Tree count for 1 x 2 is #{traverse(matrix, 1, 2)}."
p "Total multiplied together is #{total}"