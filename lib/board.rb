# rubocop:disable Lint/LiteralInInterpolation
class Board
  def create_board(arr, board )
    arr = (1...board*board+1).to_a        

    

  end

  def board_game(arr, board, new_board)
    
      arr = (0...board*board).to_a        
      until arr == []
        new_board += [arr[0..board-1]]
          arr.shift(board)
      end 
          
      new_board
  end


end






def print_table(arr, margin_width = 2)

  column_widths = []
  arr.each do |row|
    row.each.with_index do |cell, column_num|
      column_widths[column_num] = [column_widths[column_num] || 0, cell.to_s.size].max
    end
  end

  puts (arr.collect do |row|
    row.collect.with_index do |cell, column_num|
      cell.to_s.ljust(column_widths[column_num] + margin_width)
    end.join
  end)
end


  class ChangeNumbers

    def number_change(item, arr, sim)
      arr.collect! do |element|
        element == item ? sim : element
      end
    end
    
  end

  # rubocop:enable Lint/LiteralInInterpolation
