#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches

require '../lib/logic'




  grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  grilla_close = [0]

  def create_grid(arr)
    puts "| #{arr[0]} | #{arr[1]} | #{arr[2]} |"
    puts "| #{arr[3]} | #{arr[4]} | #{arr[5]} |"
    puts "| #{arr[6]} | #{arr[7]} | #{arr[8]} |"
  end

  

    win_c = WinCondition.new
    
    puts 'Whats your name'
    @name1 = gets.chomp
    @name1 = gets.chomp while @name1 == ''
  
    puts 'Whats the name of your partner?'
    @name2 = gets.chomp
    @name2 = gets.chomp while @name2 == ''

    win_c.logic(grilla_close, grilla, @name1, @name2)  
  


  



# rubocop:enable Metrics/MethodLength, Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/BlockNesting, Style/IdenticalConditionalBranches
