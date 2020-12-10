
#require '../bin/main'

class WinCondition
 
  def win(lock, arr, sim, player)
    if (arr[0] == sim and arr[1] == sim and arr[2] == sim) || (arr[3] == sim and arr[4] == sim and arr[5] == sim) || (arr[6] == sim and arr[7] == sim and arr[8] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!! \n".upcase
      
      lock.clear
    elsif (arr[0] == sim and arr[3] == sim and arr[6] == sim) || (arr[1] == sim and arr[4] == sim and arr[7] == sim) || (arr[2] == sim and arr[5] == sim and arr[8] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!! \n".upcase
      
      lock.clear
    elsif (arr[0] == sim and arr[4] == sim and arr[8] == sim) || (arr[2] == sim and arr[4] == sim and arr[6] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!!".upcase
      
      lock.clear
    elsif arr.count { |a| a == 'X' } == 5
      puts 'DRAW'
      lock.clear
    end
  end

  def change_element(item, array, simbol)   
    array.collect! { |element|
      (element == item) ? simbol : element
    }
    self
  end  

   def logic(grilla_close, grid, name1, name2)
    move = true
    
    while grilla_close != []
      if move == true
        create_grid(grid)
        print "It is #{name1} turn Pick a number : "
        turn1 = gets.chomp
        if turn1 =~ /^-?[1-9]+$/
          turn1 = turn1.to_i
          turn1 > 10 ? redo : turn1
          change_element(turn1, grid, 'X')
        else
          redo
        end
        win(grilla_close, grid, 'X', name1)
        
        move = false
    
      else
    
        create_grid(grid)
        print "It is #{name2} turn Pick a number : "
        turn2 = gets.chomp
        if turn2 =~ /^-?[1-9]+$/
          turn2 = turn2.to_i
          turn2 > 10 ? redo : turn2
          change_element(turn2, grid, 'O')    
        else     
          redo
        end
        win(grilla_close, grid, 'O', name2)
        
        move = true
      end
      
      

    end
    create_grid(grid)
    
    
  end  



end









# rubocop:enable Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
