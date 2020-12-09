#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches

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

    puts "INSTRUCTIONS"
    puts "TIC TAC TOE"
    puts "Each player gets a turn"
    puts "Don't try to cheat or you will get penalized"
    puts "You will loose a turn"
    puts 'Whats your name?'
    
    @player1 = gets.chomp
    @player1 = gets.chomp while @player1 == ''
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp
    @player2 = gets.chomp while @player2 == ''
    move = true
    while @@grilla != []
      if move == true
        create_grid(@@grilla)
        print "It is #{@player1} turn Pick a number : "
        turn1 = gets.chomp
        if turn1 =~ /^-?[1-9]+$/
          turn1 = turn1.to_i
          turn1 > 10 ? redo : turn1
          win_c.change_element(turn1, @@grilla, "X")
        else
          puts 'Please choose a number from 1-9'
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
          turn2 > 10 ? redo : turn2
          win_c.change_element(turn2, @@grilla, "O")
        else
          puts 'Please choose a number from 1-9'
          redo
        end
        win_c.win(@@grilla, 'O', @player2)
        move = true
      end
    end
    puts 'Final Board'
    create_grid(win_c.final_arr)
  end
end
game = InitGame.new
game.dialogo

# rubocop:enable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches
