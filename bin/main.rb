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
  @grid = WinCondition.new
  @check = ChangeNumbers.new
  
      puts "Please type a name? else will be #{@player1[:name]}"
      @player1[:name] = gets.chomp
      @player1[:name] = gets.chomp while @player1[:name] == ''
      
      puts "Please type a name? else will be #{@player2[:name]}"
      @player2[:name] = gets.chomp
      @player2[:name] = gets.chomp while @player2[:name] == ''


      puts @grid.create_grid(@grilla)

     


def self.play
  game = true
  @turn_count = 0
  while game
    @turn_count += 1
    turns
  end

  
end


  def self.turns
    @current_player = @turn_count.odd? ? @player1 : @player2
    print "#{@current_player[:name]}, Please choose a number between 1-9: "     
      @current_player[:number] = gets.chomp.to_i
      if @grilla.include?(@current_player[:number])
        @check.number_change(@current_player[:number], @grilla, @current_player[:simbol])
        puts @grid.create_grid(@grilla)
      else
        puts "Please choose a valid input"
        turns   
      end
  end

  play
      
  turns

end

# rubocop:enable Style/IdenticalConditionalBranches