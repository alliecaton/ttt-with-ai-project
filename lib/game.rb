class Game 

    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
        [0,1,2], #top across
        [3,4,5], #middle accross
        [6,7,8], #bottom across
        [0,3,6], #left down 
        [1,4,7], #middle down
        [2,5,8], #right down
        [0,4,8],
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def board
        @board 
    end

    def current_player
        if board.turn_count.even? 
            @player_1
        elsif board.turn_count.odd?
            @player_2
        end 
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
                true 
                combo 
            elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
                true 
                combo 
            else 
                false
            end 
        end 
    end 

    def draw? 
        !self.won? && board.full?
    end

    def over? 
        self.won? || self.draw?
    end

    def winner
        if array = won? 
            @board.cells[array[0]]
        end
    end

    def turn
        player = current_player
        current_move = current_player.move(board)
        if board.valid_move?(current_move)
            board.update(current_move, player)
        else
            puts "Invalid input, please enter another number"
            current_player.move(board)
        end
    end

    def play 
        while !over?
            turn 
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end 

end 