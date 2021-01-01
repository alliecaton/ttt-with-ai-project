module Players
class Human < Player

    def move(board) 
        puts "Please input a number between 1 and 9:"
        input = gets.chomp
        input 
    end 

end 

end