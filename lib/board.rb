# rubocop:disable Lint/LiteralInInterpolation
class Board

  def initialize
    @size = 0
    @array = []
    
  end


  def create_board(board)
    @array = (1...board*board+1).to_a      
  end
  

  def board_game(board, selection, sim )

    number_change(selection, create_board(board), sim)
    
    max_count = board**2
    count = 0
      while count < max_count
        @array << @array[count..((board-1)+count)]
        count += board
      end
      @array.slice!(0..(max_count-1))
      #print @array

      print_table(@array)


    end


     def number_change(selection, board, sim)
       board.collect! do |element|
         element == selection ? sim : element
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








end

# nuevo = Board.new

# puts "size"
# size = gets.chomp.to_i  

# puts 'whats the number?'
# num = gets.chomp.to_i

# puts "symbol"
# sim = gets.chomp

# nuevo.board_game(size, num, sim)







    

   
#   # rubocop:enable Lint/LiteralInInterpolation
