module Players

class Computer < Player

    def move(board) 
        board.cells.each_with_index do |cell, index|
            return "#{index + 1}" if board.cells[index] == " "
        end
    end

end

end