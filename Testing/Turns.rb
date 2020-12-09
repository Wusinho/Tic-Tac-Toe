class Turn 

    def initialize(playerA, playerB, turn_P1, turn_P2)
       @Player_1 = playerA   
       @Player_2 = playerB
       @turn_P1 = turn_P1
       @turn_P2 = turn_P2
       
    end

    def call_turn

        switch = true
        move = true
        while switch
            switch = false
            if move == true
            puts "It is #{@Player_1} turn Pick a number "
            @turn_P1
            puts "the number you picked id #{@turn_P1} "
            else
            puts "It is #{@Player_2} turn Pick a number"
            @turn_P2
            puts "the number you picked id #{@turn_P2} "

            end
           
                
              
        end
               
             
            
    end
end



#turno = Turn.new("Pedro", "Pablo")
#turno.call_turn