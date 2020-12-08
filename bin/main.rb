#!/usr/bin/env ruby

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
