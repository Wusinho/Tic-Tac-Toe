#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting

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
          @@grilla[turn1 - 1] = 'X'
        else
          puts 'Please choose a number from 0-9'
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
          @@grilla[turn2 - 1] = 'O'
        else
          puts 'Please choose a number from 0-9'
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

# rubocop:enable Style/IdenticalConditionalBranches, Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting
=======

grilla = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
SEPARATOR = '-------------'.freeze
def create_grid(grilla)
  puts ["| #{grilla[1]} | #{grilla[2]} | #{grilla[3]} |"]
  puts SEPARATOR
  puts ["| #{grilla[4]} | #{grilla[5]} | #{grilla[6]} |"]
  puts SEPARATOR
  puts ["| #{grilla[7]} | #{grilla[8]} | #{grilla[9]} |"]
end

def do_move(move, _player2, grilla)
  until ((1..9).include? move) && (grilla.value? move)
    puts 'Invalid move'
    puts 'Write another number from the board'
    move = gets.chomp.to_i
  end
  grilla[move] = 'X'
  create_grid(grilla)
  puts "#{@player1} it's your turn. Choose one number from the board"
end

# loop
def game_on(_player1, player2, grilla)
  # call a method to verify if theres a winner when the conditions are accomplish or if it's a draw
  # when the loop ends, ask the players if they want to play again or exit the game
  win = false
  draw = false
  until win || draw
    puts "#{@player1}, it's your turn, choose a number from the board"
    move = gets.chomp
    do_move(move, @player1, grilla)
    puts "#{@player2}, it's your turn, choose a number from the board"
    move = gets.chomp
    do_move(move, player2, grilla)
    create_grid(grilla)
    draw = true
  end
  scenarios = { 1 => "#{@player1}, fatality, you won!", 2 => "#{@player2},
                      fatality, you won!",
                3 => "It's a draw!" }
  result = Random.new.rand(1..3)
  puts scenarios[result]
end
# mock
puts 'Welcome to Tik-tak-toe EXTREME edition'
puts ' '
puts 'Hey Player One, whats your name?'
@player1 = gets.chomp
puts "Hello #{@player1} \n
Whats the name of the Player Two?"
@player2 = gets.chomp
puts "Hello #{@player2}"
puts ' '
puts "#{@player1} will be the X and start the game \n
#{@player2} will be the O and make the second move"
puts ' '
puts "This is the board of the game, \n
Each square has a number and it starts at 1 and ends at 9. \n"
create_grid(grilla)
puts 'Write your number to select your move.'

4.times do
  game_on(@player1, @player2, grilla)
end
puts 'This is the score'
puts "#{@player1}: 1"
puts "#{@player2}: 0"
puts 'Do you want to play another game?'
puts 'Select yes or no'
other_game = gets.chomp
puts "You answer #{other_game}. Let's play again!"
puts 'See you later!'
