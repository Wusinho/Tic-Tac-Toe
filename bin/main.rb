#!/usr/bin/env ruby
# rubocop:disable Style/ClassVars, Style/IdenticalConditionalBranches, Layout/LineLength

require '../lib/logic'
require 'rainbow'
require 'tty-font'

class Dialogue
  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]

  win_c = WinCondition.new

  ################################# NEW #####################
  font = TTY::Font.new(:starwars)
  puts "\n"
  puts Rainbow(font.write('Tik-Tak-Toe')).red.bright
  puts (Rainbow('CUTE EDITION').blueviolet.bright.blink.bg(:yellow)).center(50)
  puts "\n"
  puts Rainbow('  Instructions  '.center(50, '*')).green
  puts "\n"
  puts Rainbow("This is the board of the game.".center(10)).cyan
  print Rainbow(win_c.create_grid(@@grilla)).yellow
  puts Rainbow("Each square has an index number from 1 to 9.\n\nWrite the number where you want to place your move.".center(10)).cyan
  puts "\n"
  puts Rainbow('*'.center(50, '*')).green
  puts (Rainbow("Let's start\n").blue.blink).center(65)
  puts Rainbow("What's the name of player #1?").darkcyan
  @playe1_name = gets.chomp
  @playe1_name = gets.chomp while @playe1_name == ''
  puts "\n"
  puts Rainbow("What's the name of player #2?").chocolate
  @playe2_name = gets.chomp
  @playe2_name = gets.chomp while @playe2_name == ''
  posible_move = true
  while grilla_close != []
    if posible_move == true
      print win_c.create_grid(@@grilla)
      print Rainbow("It is #{@playe1_name} turn's make your move: ").darkcyan
      @playe1_turn = gets.chomp.to_i
      win_c.change_element(@playe1_turn, @@grilla, Rainbow('X').darkred.bright)
      win_c.win(grilla_close, @@grilla, 'X', @playe1_name)
      posible_move = false
    else
      print win_c.create_grid(@@grilla)
      print Rainbow("It is #{@playe2_name} turn Pick a number : ").chocolate
      @playe2_turn = gets.chomp.to_i
      win_c.change_element(@playe2_turn, @@grilla, Rainbow('O').darkblue.bright)
      win_c.win(grilla_close, @@grilla, 'O', @playe2_name)
      posible_move = true
    end
  end
  puts win_c.create_grid(@@grilla)
  puts win_c.win(grilla_close, @@grilla, 'X')
end

# rubocop:enable Style/ClassVars, Style/IdenticalConditionalBranches, Layout/LineLength
