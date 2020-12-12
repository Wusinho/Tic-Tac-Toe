#!/usr/bin/env ruby
# rubocop:disable Style/ClassVars, Style/IdenticalConditionalBranches, Layout/LineLength

require_relative '../lib/logic'
require_relative '../lib/board'
require 'rainbow'
require 'tty-font'

@player1 = {
  name: 'Player 1',
  simbol: Rainbow('X').darkred,
  number: 0
}
@player2 = {
  name: 'Player 2',
  simbol: Rainbow('O').darkblue,
  number: 0
}
@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
@checkout = ['Tic-tac-toe']
@board = Board.new

font = TTY::Font.new(:starwars)
puts "\n"
puts Rainbow(font.write('Tik-Tak-Toe')).red.bright
puts (Rainbow('COLOR EDITION').blueviolet.bright.blink.bg(:yellow)).center(50)
puts "\n"
puts Rainbow('  Instructions  '.center(50, '*')).green
puts "\n"
puts Rainbow("This is the board of the game: ".center(10)).cyan
print Rainbow(@board.board_game(@grilla)).yellow
puts Rainbow("Each square has an index number from 1 to 9.\n\nWrite the number where you want to place your move.".center(10)).cyan
puts "\n"
puts Rainbow('*'.center(50, '*')).green
puts (Rainbow("Let's start\n").blue.blink).center(65)
@turn_count = 0

@check = ChangeNumbers.new
@analize = Analize.new
puts Rainbow(" >>Please enter a name or it will be #{@player1[:name]}\n").darkcyan
@player1[:name] = gets.chomp
@player1[:name] = gets.chomp while @player1[:name] == ''
puts Rainbow(">> Please enter a name or it will be #{@player2[:name]}").chocolate
@player2[:name] = gets.chomp
@player2[:name] = gets.chomp while @player2[:name] == ''
puts @board.board_game(@grilla)

def self.turns
  while @checkout != []
    @current_player = @turn_count.odd? ? @player2 : @player1
    print Rainbow(">> #{@current_player[:name]}, Please choose a number between 1-9: ").green
    @current_player[:number] = gets.chomp.to_i
    if @grilla.include?(@current_player[:number])
      @check.number_change(@current_player[:number], @grilla, @current_player[:simbol])
      puts @board.board_game(@grilla)
      @turn_count += 1
      @analize.conditions(@grilla, @current_player[:name], @current_player[:simbol], @checkout)
    else
      puts @board.board_game(@grilla)
      puts Rainbow(">> Invalid move #{@current_player[:number]}").red.bright
      turns
    end
  end
end
turns
puts (Rainbow(@analize.conditions(@grilla, @current_player[:name], @current_player[:simbol], @checkout)).white.bright.blink).center(65)
