# rubocop:disable Lint/LiteralInInterpolation
class Board
  def create_board(board)
    @arr = (1...board*board+1).to_a     
    print @arr   
  end
  @arr = []

  def board_game
    puts 'size?'
    size = gets.chomp.to_i
    create_board(size)
      # new_board = []
      # arr = (0...board*board).to_a        
      # until arr == []
      #   new_board += [arr[0..board-1]]
      #     arr.shift(board)
      # end 
          
      # arr << new_board
      # print new_board
      # print arr
  end

end

new_arr = []


nuevo = Board.new



#nuevo.board_game


arr = [1,2,3,4,5,6,7,8,9]

def selection (array)
  #arr2D = []
count = 0
  while count < 9
    array << array[count..(2+count)]
    array.drop(3)
    count += 3
    
    
  end
  #array.delete(9)
  print array

  #print array.drop(9)
   #print array

end

#arr = [ [1,2,3], [4,5,6], [7,8,9]]

selection(arr)


# def print_table(arr, margin_width = 2)

#   column_widths = []
#   arr.each do |row|
#     row.each.with_index do |cell, column_num|
#       column_widths[column_num] = [column_widths[column_num] || 0, cell.to_s.size].max
#     end
#   end

#   puts (arr.collect do |row|
#     row.collect.with_index do |cell, column_num|
#       cell.to_s.ljust(column_widths[column_num] + margin_width)
#     end.join
#   end)
# end




#     def number_change(item, arr, sim)
#       arr.collect! do |element|
#         element == item ? sim : element
#       end
#     end
    

   
#   # rubocop:enable Lint/LiteralInInterpolation
