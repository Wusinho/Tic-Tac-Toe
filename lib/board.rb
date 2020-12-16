# rubocop:disable Lint/LiteralInInterpolation
class Board
  def create_board(arr, board )
    arr = (1...board*board+1).to_a        
    arr
    print arr

  end

  def board_game(arr, board, new_board)
      arr = (0...board*board).to_a        
      until arr == []
        new_board += [arr[0..board-1]]
          arr.shift(board)
      end 
          
      print new_board
  end
end

arr = []
new_arr = []
puts 'size?'
size = gets.chomp.to_i

nuevo = Board.new

nuevo.create_board(arr, size)

nuevo.board_game(arr, size, new_arr )





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
