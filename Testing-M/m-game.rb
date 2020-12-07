require_relative "m-Grid"
require_relative "m-Turns"

class InitGame
   

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

        turn = Turn.new(@Player_1, @Player_2)
        turn.call_turn
        
        # Condition to win
        win = Win.new(@Player_1, @Player_2)
        win.call_winner


    end
end

game = InitGame.new
game.Dialogo

