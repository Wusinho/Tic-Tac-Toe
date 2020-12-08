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
    # Input Players
    puts 'Whats your name?'
    @player1 = gets.chomp

    puts "Hello #{@player1} "
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp

    puts "Hello #{@player2} "

    win_c = WinCondition.new

    # switch = true
    move = true

    while @@grilla != []

      if move == true
        create_grid(@@grilla)
        print "It is #{@player_1} turn Pick a number : "

        turn1 = gets.chomp.to_i
        @@grilla[turn1 - 1] = 'X'

        win_c.win(@@grilla, 'X', @player_1)
        move = false

      else

        create_grid(@@grilla)
        print "It is #{@player2} turn Pick a number : "

        turn2 = gets.chomp.to_i
        @@grilla[turn2 - 1] = 'O'

        win_c.win(@@grilla, 'O', @player2)

        move = true
      end

    end
  end
end
game = InitGame.new
game.dialogo

# rubocop:enable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars
