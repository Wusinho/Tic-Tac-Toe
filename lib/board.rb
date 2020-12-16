class Board
  def board_game(arr)
    <<~HEREDOC
          | #{arr[0]} | #{arr[1]} | #{arr[2]} |
          | #{arr[3]} | #{arr[4]} | #{arr[5]} |
          | #{arr[6]} | #{arr[7]} | #{arr[8]} |
    HEREDOC
  end
end

class ChangeNumbers
  def number_change(item, arr, sim)
    arr.collect! do |element|
      element == item ? sim : element
    end
  end
end
