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

  def cheat_name?(true_name)
    while true_name == ""
        puts "Please choose a name"
        true_name = gets.chomp    
        
    end
    puts "Hello #{true_name} "
  end

  def cheat_number?(num)
    
    while num != 1 or num != 2 or num != 3 or num != 4 or num != 5 or num != 6 or num != 7 or num != 8 or num != 9  
        
        puts "Please choose a number between 1 and 9"
        num = gets.chomp
        puts num.class
    end
    return num
  end   


  def dialogo
  win_c = WinCondition.new
    
 
    puts 'Whats your name?'
    players[pla1] = gets.chomp
    cheat_name?(@player1)
    

    puts 'Whats the name of your partner?'
    players[pla2] = gets.chomp
    
    cheat_name?(@player2)



    # switch = true
    move = true

    while @@grilla != []

      if move == true
        create_grid(@@grilla)
        print "It is #{@player1} turn Pick a number : "

        turn1 = gets.chomp.to_i
        puts turn1.class
        cheat_number?(turn1)

        @@grilla[turn1 - 1] = 'X'

        puts win_c.win(@@grilla, 'X', @player1)
        move = false

      else

        create_grid(@@grilla)
        print "It is #{@player2} turn Pick a number : "

        turn2 = gets.chomp
        
        cheat_number?(turn2)

        @@grilla[turn2 - 1] = 'O'

        puts win_c.win(@@grilla, 'O', @player2)
        
        move = true
      end

    end
  end
end
game = InitGame.new
game.dialogo

# rubocop:enable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars
