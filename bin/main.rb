#!/usr/bin/env ruby
puts 'Hello world!'
require_relative "Grid"

class InitGame < Grid
    
    def initialize(name1 = 'pepeBOT', name2 = 'raulBOT')
        @turnA = name1
        @turnB = name2
     end
   
     @@grilla = [1,2,3,4,5,6,7,8,9]
     
     def create_grid(arr)

       puts "| #{arr[0]} | #{arr[1]} | #{arr[2]} |"
       
       puts "| #{arr[3]} | #{arr[4]} | #{arr[5]} |"
       
       puts "| #{arr[6]} | #{arr[7]} | #{arr[8]} |"
     end


    def Dialogo
       # Input Players
       puts 'Whats your name?'
       @Player_1 = gets.chomp

       puts "Hello #{@Player_1} "
       puts 'Whats the name of your partner?'
       @Player_2 = gets.chomp

       puts "Hello #{@Player_2} "
        
        switch = true
        move = true
        while switch
            if move == true
                create_grid(@@grilla)

                print "It is #{@Player_1} turn Pick a number : "
                @turn_01 = gets.chomp.to_i
                @@grilla[@turn_01] = "X"
                

                move = false
                

            else
                create_grid(@@grilla)
                print "It is #{@Player_2} turn Pick a number : "

                @turn_02 = gets.chomp.to_i
                @@grilla[@turn_02] = "O"

                
                move = true
            end

        end





    end

  
  


end

game = InitGame.new
game.Dialogo
#game.change_element(4)
#game.change_element(5)
#game.change_element(6)

