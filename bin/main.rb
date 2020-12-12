#!/usr/bin/env ruby

require_relative '../lib/logic'

class Dialogue
  @player1 = {
    name: 'Pepe Pistolas',
    simbol: 'X',
    number: 0
  }

  @player2 = {
    name: 'Santo Cachon',
    simbol: 'O',
    number: 0
  }

  @grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @checkout = ['Tic-tac-toe']

  puts @checkout
  @turn_count = 0

  @board = Board.new
  @check = ChangeNumbers.new
  @win = WinCondition.new

  puts "Please type a name? else will be #{@player1[:name]}"
  @player1[:name] = gets.chomp
  @player1[:name] = gets.chomp while @player1[:name] == ''

  puts "Please type a name? else will be #{@player2[:name]}"
  @player2[:name] = gets.chomp
  @player2[:name] = gets.chomp while @player2[:name] == ''

  puts @board.board_game(@grilla)

  

  def self.turns
  
    #puts "veces q pasa al llmar turn #{@vecesXturns}"
    while @checkout != []
  
      @current_player = @turn_count.odd? ? @player2 : @player1
  
      
      print "#{@current_player[:name]}, Please choose a number between 1-9: "


      @current_player[:number] = gets.chomp.to_i

      if @grilla.include?(@current_player[:number])
        @check.number_change(@current_player[:number], @grilla, @current_player[:simbol])
        puts @board.board_game(@grilla) 

        @turn_count += 1
        @win.win(@grilla, @current_player[:name], @current_player[:simbol], @checkout)
      else
        puts @board.board_game(@grilla)
        puts "plz choose a correct value not #{@current_player[:number]}"
        turns
      end
    end
  end
  turns

  puts @win.win(@grilla, @current_player[:name], @current_player[:simbol], @checkout)

end
