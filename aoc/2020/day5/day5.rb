f = File.open("./input.txt")
data = f.read.split("\n")

def ticket_numbers(data)
    tickets = []
data.each do |t|
    legend = { "F"=>0, "B"=>1, "L"=>0, "R"=>1 }
    tickets.push(t.gsub(/[F,B,R,L]/, legend).to_i(2))
    end
     tickets.sort
end

def locate(tickets)
    tickets.each_with_index do |seat, i|
        diff = (seat.to_i - tickets[i+1].to_i).abs
        if diff > 1
            p seat.next
            break
        end

    end
end
locate(ticket_numbers(data))