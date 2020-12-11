
# require '../bin/main'
# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength, Lint/LiteralInInterpolation
  

class Board
  def board_game(arr)
    <<~HEREDOC
      #{'    '}
          | #{arr[0]} | #{arr[1]} | #{arr[2]} |
          | #{arr[3]} | #{arr[4]} | #{arr[5]} |
          | #{arr[6]} | #{arr[7]} | #{arr[8]} |
      #{'    '}
    HEREDOC
  end
end


class WinCondition

  def win(arr, player, sim, checkout)
    if (arr[0] == sim and arr[1] == sim and arr[2] == sim) || (arr[3] == sim and arr[4] == sim and arr[5] == sim) || (arr[6] == sim and arr[7] == sim and arr[8] == sim)
      checkout.clear     
      return "#{player} WINS"
    elsif (arr[0] == sim and arr[3] == sim and arr[6] == sim) || (arr[1] == sim and arr[4] == sim and arr[7] == sim) || (arr[2] == sim and arr[5] == sim and arr[8] == sim)
      checkout.clear
      return "#{player} WINS"
    elsif (arr[0] == sim and arr[4] == sim and arr[8] == sim) || (arr[2] == sim and arr[4] == sim and arr[6] == sim)
      checkout.clear
      return "#{player} WINS"  
    else
    end
  end 
end

class DrawCondition
  def draw(arr, sim, player, checkout)
    if arr.count { |a| a == 'X' } == 5   
    checkout.clear
     return "IT'S A DRAW"
    end
 end
end

class ChangeNumbers
  def number_change(item ,arr, sim)
      arr.collect! do |element|
        element == item ? sim : element
      end
    end
end

#turno = Loop.new
#turno.turns('Pedro', 'ablo')





 




# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength, Lint/LiteralInInterpolation






