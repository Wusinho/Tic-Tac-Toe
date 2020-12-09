class Turn
  def initialize(playerA, playerB)
    @Player_1 = playerA
    @Player_2 = playerB
  end

  def call_turn
    switch = true
    move = true
    while switch
      switch = false
      if move == true
        puts "It is #{@Player_1} turn "

      else
        puts "It is #{@Player_2} turn "

      end

    end
  end
end

# turno = Turn.new("Pedro", "Pablo")
# turno.call_turn
