#!/usr/bin/env ruby

require_relative '../lib/logic'
require_relative '../lib/board'

@player1 = {
  name: 'Player 1',
  simbol: 'X',
  number: 0
}
@player2 = {
  name: 'Player 2',
  simbol: 'O',
  number: 0
}
@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
@checkout = ['Tic-tac-toe']
puts @checkout
@turn_count = 0
@board = Board.new
@check = ChangeNumbers.new
@analize = Analize.new
puts "Please type a name? or it will be #{@player1[:name]}"
@player1[:name] = gets.chomp
@player1[:name] = gets.chomp while @player1[:name] == ''
puts "Please type a name? or it will be #{@player2[:name]}"
@player2[:name] = gets.chomp
@player2[:name] = gets.chomp while @player2[:name] == ''
puts @board.board_game(@grilla)

def self.turns
  while @checkout != []
    @current_player = @turn_count.odd? ? @player2 : @player1
    print "#{@current_player[:name]}, Please choose a number between 1-9: "
    @current_player[:number] = gets.chomp.to_i
    if @grilla.include?(@current_player[:number])
      @check.number_change(@current_player[:number], @grilla, @current_player[:simbol])
      puts @board.board_game(@grilla)
      @turn_count += 1
      @analize.check_rows(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      @analize.check_collumns(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      @analize.check_cross_right(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      @analize.check_cross_left(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      @analize.draw(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)

      
    else
      puts @board.board_game(@grilla)
      puts "The position has already been taken, please choose another number #{@current_player[:number]}"
      turns
    end
  end
end
turns

puts @analize.check_rows(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
puts @analize.check_collumns(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
puts @analize.check_cross_right(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
puts @analize.check_cross_left(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
puts@analize.draw(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)

