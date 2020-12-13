# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength

class Analize
  
  def check_rows(arr, board, name, simbol, checkout )
    new_grid = []
    new_grid += arr
    count = 0         
        while count  < board         
          if new_grid.shift(board).all? {|x| x == simbol}

            checkout.clear 
            return "#{name} WINS!!!!!!"              
          end
          count += 1
        end
  end 

  def check_collumns(arr, board, name, simbol, checkout )
    count = 0
    arr_check = []
    while count < board
      arr.each_with_index do |element, index|
        if (index+count) % board == 0  
          arr_check << element
          
        end
      end
      if arr_check.all? {|x| x == simbol} 
        checkout.clear 
        return "#{name} WINS!!!!!!"  
      end
      arr_check.shift(board) 
      count += 1
    
    end
end

    def check_cross_right(arr, board, name, simbol, checkout ) 
      arr_check = []
      arr.each_with_index do |element, index|
        if (index) % (board + 1) == 0
          arr_check << element
        end
      end
      if arr_check.all? {|x| x == simbol} 
        checkout.clear 
        return "#{name} WINS!!!!!!"  
      end
    end

    def check_cross_left(arr, board, name, simbol, checkout )
      arr_check = []
      arr.each_with_index do |element, index|
        if (index) % (board-1) == 0 and index != 0 and index != ((board**2)-1)   
          arr_check << element
        end
      end
      if arr_check.all? {|x| x == simbol} 
         checkout.clear 
         return "#{name} WINS!!!!!!"  
      end
    end

    def draw(arr, board, name, simbol, checkout )
      if arr.count {|x|  x == simbol} == ((board**2) /2.to_f).ceil  
        checkout.clear
        return "DRAW" 
      end
    end


end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
