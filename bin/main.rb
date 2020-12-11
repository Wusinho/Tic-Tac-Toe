#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches

require_relative '../lib/logic'

class Dialogue 


  
    player1 = {
      :name => 'botPaco',
      :simbol => 'X'
    }
  
    player2 = {
      :name => 'botLucho',
      :simbol => '-'
    }
  

  @grilla = [1, 2, 3, 4, 5, 6, 7, 8, 9]
 


sim_c = Loop.new
  
  

    
def self.user_input(player)

    puts "Please type a name? else will be #{player[:name]}"
    player[:name] = gets.chomp
    #player[:name] = gets.chomp while @player[:name] == ''
    return player[:name]
end

sim_c.turns(user_input(player1), user_input(player2))


end

# rubocop:enable Style/IdenticalConditionalBranches