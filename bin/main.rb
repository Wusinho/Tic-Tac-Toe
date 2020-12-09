#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars

require_relative '../lib/logic'

class InitGame < WinCondition
  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def create_grid(arr)
    puts "| #{arr[0]} | #{arr[1]} | #{arr[2]} |"
    puts "| #{arr[3]} | #{arr[4]} | #{arr[5]} |"
    puts "| #{arr[6]} | #{arr[7]} | #{arr[8]} |"
  end

  def dialogo
  win_c = WinCondition.new
    
    puts 'Whats your name?'
    @player1 = gets.chomp 
    while @player1 == ''
        @player1 = gets.chomp   
    end
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp
    while @player2 == ''
        @player2 = gets.chomp   
    end

    move = true
    while @@grilla != []

      if move == true
        create_grid(@@grilla)
        print "It is #{@player1} turn Pick a number : "

        turn1 = gets.chomp       
          if turn1 =~ /^-?[1-9]+$/
            turn1 = turn1.to_i
            turn1 > 10 ?  redo : turn1
            @@grilla[turn1 - 1] = 'X'
          else
            puts "Please choose a number from 0-9"
            redo  
          end
        win_c.win(@@grilla, 'X', @player1)
        move = false
      else
        create_grid(@@grilla)
        print "It is #{@player2} turn Pick a number : "   
           turn2 = gets.chomp
           if turn2 =~ /^-?[1-9]+$/
            turn2 = turn2.to_i
            turn2 > 10 ?  redo : turn2
            @@grilla[turn2 - 1] = 'O'
          else
            puts "Please choose a number from 0-9"
            redo  
          end       
        win_c.win(@@grilla, 'O', @player2)        
        move = true
      end

    end
  end
end
game = InitGame.new
game.dialogo

# rubocop:enable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars
