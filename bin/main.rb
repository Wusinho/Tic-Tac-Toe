#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches

require_relative '../lib/logic'

class Dialogue 

    @player1 = {
      :name => 'botPaco',
      :simbol => 'X',
      :number => 0
    }
  
    @player2 = {
      :name => 'botLucho',
      :simbol => '-',
      :number => 0
    }
  
  @grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @checkout = ["este es un array para vacear"]
  
  puts @checkout
  @board = Board.new
  @check = ChangeNumbers.new
  @win = WinCondition.new
  @draw = DrawCondition.new
  
      puts "Please type a name? else will be #{@player1[:name]}"
      @player1[:name] = gets.chomp
      @player1[:name] = gets.chomp while @player1[:name] == ''
      
      puts "Please type a name? else will be #{@player2[:name]}"
      @player2[:name] = gets.chomp
      @player2[:name] = gets.chomp while @player2[:name] == ''


      puts @board.board_game(@grilla)

  def self.turns
    @turn_count = 0

    while @checkout != []
      @turn_count += 1
     
    @current_player = @turn_count.odd? ? @player1 : @player2
    print "#{@current_player[:name]}, Please choose a number between 1-9: "  
      

      @current_player[:number] = gets.chomp.to_i
      

      if @grilla.include?(@current_player[:number])
        

        @check.number_change(@current_player[:number], @grilla, @current_player[:simbol])
        puts @board.board_game(@grilla)

        
        @win.win(@grilla, @current_player[:name], @current_player[:simbol], @checkout)
        
        @draw.draw(@grilla, @current_player[:name], @current_player[:simbol], @checkout)

        if @checkout == []
        
        else

        

        end

      else
      
        turns   
      end
      

    end
  end


 
      
  turns

  
  puts  @win.win(@grilla, @current_player[:name], @current_player[:simbol], @checkout)
  puts @draw.draw(@grilla, @current_player[:name], @current_player[:simbol], @checkout)

end

# rubocop:enable Style/IdenticalConditionalBranches
