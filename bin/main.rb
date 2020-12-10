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
  puts Rainbow(font.write('Tik-Tak-Toe', letter_spacing: 3)).red.bright
  puts (Rainbow('CUTE EDITION').blueviolet.bright.blink.bg(:yellow)).center(702)
  puts "\n"
  puts (Rainbow("Let's start").blue).center(150)
  puts "\n"
  print win_c.create_grid(@@grilla)

  puts "#{Rainbow('this is red').red} and #{Rainbow('this on yellow bg').red.bg(:yellow)} and #{Rainbow('even bright underlined!').red.underline.bright}"
  puts 'Each player gets a turn'
  puts "Don't try to cheat or you will get penalized"
  puts 'You will loose a turn'

  puts 'Whats your name'
  @playe1_name = gets.chomp
  @playe1_name = gets.chomp while @playe1_name == ''

  puts 'Whats the name of your partner?'
  @playe2_name = gets.chomp
  @playe2_name = gets.chomp while @playe2_name == ''

  posible_move = true
  while grilla_close != []
    if posible_move == true
      print win_c.create_grid(@@grilla)
      print "It is #{@playe1_name} turn Pick a number : "
      @playe1_turn = gets.chomp.to_i
      win_c.change_element(@playe1_turn, @@grilla, 'X')
      win_c.win(grilla_close, @@grilla, 'X', @playe1_name)
      posible_move = false
    else
      print win_c.create_grid(@@grilla)
      print "It is #{@playe2_name} turn Pick a number : "
      @playe2_turn = gets.chomp.to_i
      win_c.change_element(@playe2_turn, @@grilla, 'O')
      win_c.win(grilla_close, @@grilla, 'O', @playe2_name)
      posible_move = true
    end
  end
  puts win_c.create_grid(@@grilla)
  puts win_c.win(grilla_close, @@grilla, 'X')
end

# rubocop:enable Style/ClassVars, Style/IdenticalConditionalBranches, Layout/LineLength
