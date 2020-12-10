#!/usr/bin/env ruby
# rubocop:disable Style/ClassVars, Style/IdenticalConditionalBranches

require '../lib/logic'

class Dialogue
  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]

  win_c = WinCondition.new

  puts 'Welcome to TIC-TAC-TOE'
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

# rubocop:enable Style/ClassVars, Style/IdenticalConditionalBranches
