#!/usr/bin/env ruby

require_relative '../lib/logic'
require_relative '../lib/board'

@player1 = {
  name: 'Player 1',
  simbol: 'X'
}
@player2 = {
  name: 'Player 2',
  simbol: '+'
}

@game = {
  tablero: [],
  size: 0
}



@checkout = ['Tic-tac-toe']
#@grilla = []
@turn_count = 0

@board_display = Board.new
@analize = Analize.new

puts "Please type the size of the board? "
@game[:size] = STDIN.gets.chomp.to_i
@board_display.create_board(@game[:size] , @game[:tablero])
#print @grilla

puts "Please type a name? or it will be #{@player1[:name]}"
@player1[:name] = STDIN.gets.chomp
@player1[:name] = STDIN.gets.chomp while @player1[:name] == ''
puts "Please type a name? or it will be #{@player2[:name]}"
@player2[:name] = STDIN.gets.chomp
@player2[:name] = STDIN.gets.chomp while @player2[:name] == ''

#@board_display.board_game(@board, @current_player[:number], @current_player[:simbol])


def self.turns
  while @checkout != []
    @current_player = @turn_count.odd? ? @player2 : @player1
    print "esta es la grilla #{@game[:tablero]}"
    print "#{@current_player[:name]}, Please choose a number between 1-9: "
    @current_player[:number] = STDIN.gets.chomp.to_i
    
    
    
    if (@game[:tablero]).include?(@current_player[:number])
      @board_display.board_game(@current_player[:number], @current_player[:simbol], @game[:tablero], @game[:size])
      
    
      #@analize.check_rows(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      #@analize.check_collumns(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      #@analize.check_cross_right(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      #@analize.check_cross_left(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
      @turn_count += 1

      #@analize.draw(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)

      
    else
  #    puts @board.board_game(@grilla)
      puts "The position has already been taken, please choose another number #{@current_player[:number]}"
      turns
    end
  end
end

turns
#puts @analize.check_rows(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
#puts @analize.check_collumns(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
#puts @analize.check_cross_right(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
#puts @analize.check_cross_left(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)
#puts @analize.draw(@grilla, 3, @current_player[:name], @current_player[:simbol], @checkout)

