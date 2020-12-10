
#require '../bin/main'

class WinCondition
 

  def create_grid(arr)
    <<-HEREDOC
    
    | #{arr[0]} | #{arr[1]} | #{arr[2]} |
    | #{arr[3]} | #{arr[4]} | #{arr[5]} |
    | #{arr[6]} | #{arr[7]} | #{arr[8]} |
    
    HEREDOC
  end

  def win(lock, arr, sim, player=nil)
    if (arr[0] == sim and arr[1] == sim and arr[2] == sim) || (arr[3] == sim and arr[4] == sim and arr[5] == sim) || (arr[6] == sim and arr[7] == sim and arr[8] == sim)
      lock.clear
      
      return '!!!!!!!!!!!!!!!!!!!YOU WIN!!!!!!!!!!!!!!!!!!!'
      
    elsif (arr[0] == sim and arr[3] == sim and arr[6] == sim) || (arr[1] == sim and arr[4] == sim and arr[7] == sim) || (arr[2] == sim and arr[5] == sim and arr[8] == sim)
      lock.clear
      
      return '!!!!!!!!!!!!!!!!!!!YOU WIN!!!!!!!!!!!!!!!!!!!'
      
    elsif (arr[0] == sim and arr[4] == sim and arr[8] == sim) || (arr[2] == sim and arr[4] == sim and arr[6] == sim)
      lock.clear
      
      return '!!!!!!!!!!!!!!!!!!!YOU WIN!!!!!!!!!!!!!!!!!!!'
      
    elsif arr.count { |a| a == 'X' } == 5
      lock.clear
      
      return 'DRAW'
    end
    '!!!!!!!!!!!!!!!!!!!YOU WIN!!!!!!!!!!!!!!!!!!!'
      
  end

  def change_element(item, array, simbol)   
    array.collect! { |element|
      (element == item) ? simbol : element
    }
    self
  end  

 
end


#win = WinCondition.new
#print win.create_grid([1, 2, 3, 4, 5, 6, 7, 8, 9])









# rubocop:enable Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
