class Player

    attr_reader :token, :token_2

    def initialize(token)
        @token = token
        if @token == "X"
            @token_2 = "O"
        else 
            @token_2 = "X"
        end
    end


end