#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches

require '../lib/logic'

class Dialogue

  @@grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]

    win_c = WinCondition.new
    
    puts 'Whats your name'
    @name1 = gets.chomp
    @name1 = gets.chomp while @name1 == ''
  
    puts 'Whats the name of your partner?'
    @name2 = gets.chomp
    @name2 = gets.chomp while @name2 == ''

  
    posible_move = true
    while grilla_close != []
      if posible_move == true
        print win_c.create_grid(@@grilla)
        print "It is #{@name1} turn Pick a number : "
        turn1 = gets.chomp.to_i
        win_c.change_element(turn1, @@grilla, 'X')
        win_c.win(grilla_close, @@grilla, 'X', @name1)
        posible_move = false
      else
        print win_c.create_grid(@@grilla)
        print "It is #{@name2} turn Pick a number : "
        turn2 = gets.chomp.to_i
        win_c.change_element(turn2, @@grilla, 'O')
        win_c.win(grilla_close, @@grilla, 'O', @name2)
        posible_move = true
      end
    end
    print win_c.create_grid(@@grilla)
    puts win_c.win(grilla_close, @@grilla, 'O')

  end
dialogo = Dialogue.new

# rubocop:enable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches
