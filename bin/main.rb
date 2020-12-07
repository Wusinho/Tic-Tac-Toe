#!/usr/bin/env ruby

class InitGame
  def dialogo
    # Input Players
    puts "Welcome to Tik-tak-toe EXTREME edition"
    puts 'Whats your name?'
    @player1 = gets.chomp
    puts "Hello #{@player1} "
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp
    puts "Hello #{@player2} "
    # Grid Size
    puts 'Pick a grid size equal or greater than 3'
    @pick_size = gets.chomp # The player's pick is 3
    # Building grid to play
    grilla = Grid.new(@pick_size)
    grilla.create_grid
    grilla.print_table
    # Starting the game
    puts "This is your board"
    puts [' 1 | 2 | 3 ']
    puts [' 4 | 5 | 6 ']
    puts [' 7 | 8 | 9 ']
    puts "Excelent #{@player1} and #{@player2}, let's begin"
    # Turns Methods
    def do_move(move, @player2, grilla)
      move = move
      until ((n..n).include? move) && (grilla.value? move)
        puts 'Invalid move'
        puts 'Write another number from the board'
        move = gets.chomp.to_i
      end
      grilla[move] = 'X'
      print_table(grilla)
      puts "#{@player2} it's your turn. Choose one number from the board"
    end
    # Loop
    def game_on(@player1, @player2, grilla)
      # call a method to verify if theres a winner when the conditions are accomplish or if it's a draw
      # when the loop ends, ask the players if they want to play again or exit the game
      win = false
      draw = false
      until win || draw
        puts "#{@player1}, it's your turn, choose a number from the board"
        move = gets.chomp
        do_move(move, @player1, grilla)
        puts "#{@player2}, it's your turn, choose a number from the board"
        move = gets.chomp
        do_move(move, @player2, grilla)
        grilla.print_table
        draw = true
      end
      scenarios = { 1 => "#{@player1}, fatality, you won!", 2 => "#{@player2}, fatality, you won!", 3 => "It's a draw!"}
      resilt = Random.new.rand(1..3)
      puts scenarios[result]
  end
end
