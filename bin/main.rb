#!/usr/bin/env ruby

class InitGame
  def ialogo
    # Input Players
    puts 'Whats your name?'
    @player1 = gets.chomp
    puts "Hello #{@player1} "
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp
    puts "Hello #{@player2} "
    # Grid Size
    puts 'Pick a grid size equal or greater than 3'
    @pick_size = gets.chomp
    # Building grid to play
    grilla = Grid.new(@pick_size)
    grilla.create_grid
    grilla.print_table
    # Turns Methods
    turn = Turn.new(@player1, @player2)
    turn.call_turn
    # Condition to win
    win = Win.new(@player1, @player2)
    win.call_winner
  end
end
