#!/usr/bin/env ruby
# rubocop:disable Style/ClassVars, Style/IdenticalConditionalBranches

require '../lib/logic'

class Turn
  
  def check_turn(turn)

    switch = true
    while turn != String 
      

      if turn =~ /^-?[1-9]+$/

        turn = Integer(turn)
        puts "Pick a number from 1-9"
        turn = Integer(gets.chomp) while turn > 10
        
        puts turn.class
        return turn
        
      else
        puts "Pick a number from 1-9"

        turn = gets.chomp     
        redo  
      end
      
       
    end 

  end
end



class Dialogue
  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]
  posible_move = true

  check = Turn.new
  win_c = WinCondition.new

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
      print win_c.create_grid(@@grilla)
      print "It is #{@player1_name} turn Pick a number from 1-9 : "
      @player1_turn = gets.chomp
     
      win_c.change_element( check.check_turn(@player1_turn), @@grilla, 'X')
      win_c.win(grilla_close, @@grilla, 'X', @player1_name)
      posible_move = false
      
    else
      print win_c.create_grid(@@grilla)
      print "It is #{@player2_name} turn Pick a number from 1-9 : "
      @player2_turn = gets.chomp
  
      win_c.change_element(check.check_turn(@player2_turn), @@grilla, 'O')
      win_c.win(grilla_close, @@grilla, 'O', @player2_name)
      posible_move = true
    end
  end
  puts win_c.create_grid(@@grilla)
  puts win_c.win(grilla_close, @@grilla, 'X')
end

# rubocop:enable Style/ClassVars, Style/IdenticalConditionalBranches
