#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars

require_relative '../lib/logic'

class InitGame < WinCondition
  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def create_grid(arr)
    line = '-------------'
    puts "\n"
    puts "| #{arr[0]} | #{arr[1]} | #{arr[2]} |"
    puts line
    puts "| #{arr[3]} | #{arr[4]} | #{arr[5]} |"
    puts line
    puts "| #{arr[6]} | #{arr[7]} | #{arr[8]} |"
    puts "\n"
  end

  def dialogo
    # Input Players
    puts 'Whats your name?'
    @player1 = gets.chomp

    puts "Hello #{@player1} "
    puts 'Whats the name of your partner?'
    @player2 = gets.chomp

    puts "Hello #{@player2} "
    # Aquiiiiiiiiiiiiiiiii
    win_c = WinCondition.new

    def cheat(turn)
      number = 0
      until ((1..9).include? number) && (turn.value? number)
        puts "Nope, that's an Invalid move"
        puts 'Write another number between 1 and 9'
        number = gets.chomp.to_i
        puts 'Write a number between 1 and 9 or exit to leave.'
        number = gets.chomp
        exit if number == 'exit'
        number = number.to_i
      end
      number
    end

    # switch = true
    move = true
    turn1 = 0
    turn2 = 0

    while @@grilla != []

      if move == true
        create_grid(@@grilla)
        print "It is #{@player1} turn Pick a number : "

        turn1 = gets.chomp
        if turn1 =~ /^-?[1-9]+$/
          turn1 = turn1.to_i
          @@grilla[turn1 - 1] = 'X'
        else
          puts "Nope, that's not a correct number, try again"
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
          @@grilla[turn2 - 1] = 'O'
        else
          puts "Nope, that's not a correct number, try again"
          redo
          turn2 = gets.chomp
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
