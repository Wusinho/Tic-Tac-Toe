require_relative "Grid"
require_relative "Turns"

class InitGame < Turn
    attr_accessor 
    



    def Dialogo
        # Input Players
        puts 'Whats your name?'
        @Player_1 = gets.chomp

        puts "Hello #{@Player_1} "
        puts 'Whats the name of your partner?'
        @Player_2 = gets.chomp

        puts "Hello #{@Player_2} "

        # Grid Size
        puts 'Pick a grid size equal or greater than 3'
        @Pick_size = gets.chomp

        # Building grid to play
        grilla = Grid.new(@Pick_size) 
        grilla.create_grid
        grilla.print_table

        # Turns Methods
        turn = Turn.new(@Player_1, @Player_2, turn_P1=gets.chomp, turn_P2=gets.chomp)
        turn.call_turn
        
    

    end

   



end

game = InitGame.new
game.Dialogo

