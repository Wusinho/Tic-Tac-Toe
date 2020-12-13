# rubocop:disable Lint/LiteralInInterpolation
class Board
  @new_board = []

  def self.initialize
    @board = grid.to_i   
    @new_board = []
  end


  
  def self.board_game(arr, board, new_board)
    #@new_board = []
      arr = (0...@board**2).to_a        
      until arr == []
        @new_board += [arr[0..@board-1]]
          arr.shift(@board)
      end 
      arr = (0...@board**2).to_a        
      return @new_board
  end


end


class ChangeNumbers
  def number_change(item, arr, sim)
    arr.collect! do |element|
      element == item ? sim : element
    end
  end
end
# rubocop:enable Lint/LiteralInInterpolation
