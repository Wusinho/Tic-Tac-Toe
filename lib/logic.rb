# rubocop:disable Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
class WinCondition
  attr_reader :final_arr

  def initialize
    @final_arr = []
  end

  def win(arr, sim, player)
    if (arr[0] == sim and arr[1] == sim and arr[2] == sim) || (arr[3] == sim and arr[4] == sim and arr[5] == sim) || (arr[6] == sim and arr[7] == sim and arr[8] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!! \n".upcase
      @final_arr.concat(arr)
      arr.clear
    elsif (arr[0] == sim and arr[3] == sim and arr[6] == sim) || (arr[1] == sim and arr[4] == sim and arr[7] == sim) || (arr[2] == sim and arr[5] == sim and arr[8] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!! \n".upcase
      @final_arr.concat(arr)
      arr.clear
    elsif (arr[0] == sim and arr[4] == sim and arr[8] == sim) || (arr[2] == sim and arr[4] == sim and arr[6] == sim)
      puts "\n !!!!!!!!!!!!#{player} wins !!!!!!!!!!!".upcase
      @final_arr.concat(arr)
      arr.clear
    elsif arr.count { |a| a == 'X' } == 5
      puts 'DRAW'
      arr.clear
    end
  end

  

  def change_element(item, array, simbol)   
    array.collect! { |element|
      (element == item) ? simbol : element
    }
    self
  end  



end
# rubocop:enable Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
