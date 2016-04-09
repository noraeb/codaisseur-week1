def index( toys )
   toys.each_with_index do |toy, i|
      puts "#{i+1}) #{toy[:name]}"
   end
end

def show( toy )
  puts "#{toy[:name]}"
  puts "id: #{toy[:id]}"
  puts "quantity: #{toy[:quantity]}"
end

def ask( prompt )
   print prompt
   gets.chomp
end

toys = []

toys << { name: "Lego", id: 100101 , quantity: 50 }
toys << { name: "Jojo", id: 100102, quantity: 250  }
toys << { name: "Rocking horse", id: 100103, quantity: 2 }
toys << { name: "Barbie doll", id: 100104 , quantity: 10}
toys << { name: "X-men figure ", id: 100105 , quantity: 25}


index( toys )

puts
response = ask "What would you like to buy today? "

i = response.to_i

toy = toys[i-1]

puts
show( toy )
