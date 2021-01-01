class Board

    attr_accessor :cells, :player


    def initialize(cells= nil)
        @cells = cells
        reset!
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def position(input)
        # input = gets.chomp.to_i
        @cells[input.to_i-1]
    end

    def full? 
        @cells.none? { |x| x == " " }
    end

    def turn_count 
        @cells.select {|x| x != " " }.count
    end

    def taken?(position)
        if @cells[position.to_i-1] != " "
            true 
        else
            return false
        end
    end

    def valid_move?(input)
        if input.to_i.between?(1,9) && (@cells[input.to_i-1] == " ")
            true 
        else
           return false
        end
    end

    def update(position, player)
        @cells[position.to_i-1] = player.token
    end

end 