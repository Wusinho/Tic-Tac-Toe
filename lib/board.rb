# rubocop:disable Lint/LiteralInInterpolation
class Board

  def initialize
    @sizes = 0
    @arr = []
    
  end


  def create_board(board, arr)
    
    arr << (1..(board*board)).to_a
    arr = arr.flatten!
    
  end
  

     def number_change(selection, arr, sim)
      return selection if (selection and sim) == nil
       arr.collect! do |element|
         element == selection ? sim : element
       end
       
     end

def create_2d(board, arr, new_arr)
  
  max_count = board*board
  
  other_count = 0
  count = 0
    while count < max_count
      arr << arr[count..((board-1)+count)]
      count += board
      other_count += 1
    end
    
    new_arr = arr - arr.slice(0..(max_count-1))
    

end



 def print_table(arr, margin_width = 2)
  #print arr

   column_widths = []
   arr.each do |row|
     row.each_with_index do |cell, column_num|
       column_widths[column_num] = [column_widths[column_num] || 0, cell.to_s.size].max
     end
   end

   puts (arr.collect do |row|
     row.collect.with_index do |cell, column_num|
       cell.to_s.ljust(column_widths[column_num] + margin_width)
     end.join
   end)


   

 end


 def board_game(selection, sim, arr, board, new_arr)
   

  number_change(selection, arr , sim)
  create_2d(board, arr, new_arr)

  print_table(new_arr)

end





end









#nuevo.create_board(size, arr)
#print arr
#nuevo.create_2d(size, arr)

#nuevo.print_table(arr)






#  puts 'whats the number?'
#  num = gets.chomp.to_i

#  puts "symbol"
#  sim = gets.chomp

#  nuevo.board_game(size, num, sim)







    

   
#   # rubocop:enable Lint/LiteralInInterpolation
