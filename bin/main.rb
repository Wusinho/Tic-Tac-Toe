#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches

require_relative '../lib/logic'

class Dialogue
  def initialize
    @player1_name = name1
    @player2_name = name2
  end

  def self.get_input
      @item = gets.chomp.to_i 
  end

  @grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]
  posible_move = true


  win_c = WinCondition.new
  sim_c = Loop.new

  puts 'Welcome to TIC-TAC-TOE'
  puts 'Each player gets a turn'
  puts "Don't try to cheat or you will get penalized"
  puts 'You will loose a turn'

  puts 'Whats your name'
  @player1_name = gets.chomp
  @player1_name = gets.chomp while @player1_name == ''

  puts 'Whats the name of your partner?'
  @player2_name = gets.chomp
  @player2_name = gets.chomp while @player2_name == ''

  while grilla_close != []
    if posible_move == true
      print win_c.create_grid(@grilla)
      print "It is #{@player1_name} turn Pick a number from 1-9 : "

      get_input
      

        if @grilla.include?(@item)
          sim_c.sim_change(@item, @grilla, 'X')
        else
          puts "#{@player1_name} pick a number between 1-9 diffrente than #{@item} "
        end
      

      win_c.win(grilla_close, @grilla, 'X', @player2_name)

      posible_move = false

    else
      print win_c.create_grid(@grilla)
      print "It is #{@player2_name} turn Pick a number from 1-9 : "

        
        
          if @grilla.include?(@item)
          sim_c.sim_change(@item, @grilla, 'O')
        else
          puts "#{@player1_name} pick a number between 1-9 diffrente than #{@item} "
          
        end
      

      win_c.win(grilla_close, @grilla, '-', @player2_name)
      posible_move = true
    end
  end
  puts win_c.create_grid(@grilla)
  puts win_c.win(grilla_close, @grilla, 'X')
end

# rubocop:enable Style/IdenticalConditionalBranches