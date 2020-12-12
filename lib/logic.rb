# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
class Analize
  

  def check_rows(arr, board, name, simbol, checkout )
    arr_check = []
    arr.each_with_index do |element, index|
      if index 
        arr_check << element
          if arr_check.count == board
            
            arr_check.map.all? {|x| x == "X"} ? checkout.clear : false  
            arr_check.shift(board) 
          end
      end 
    end 
    return "#{name} WON!"
  end 

  def check_collumns(arr, board, name, simbol, checkout )
    count = 0
    arr_check = []
    while count < board
      arr.each_with_index do |element, index|
        if (index+count) % board == 0       
          arr_check << element        
          if arr_check.count == board          
            

            arr_check.all? {|x| x == simbol} ? checkout.clear : false   
            arr_check.shift(board) 
          end
        end
      end
      count += 1
  end
  return "#{name} WON!"
end


    def check_cross_right(arr, board, name, simbol, checkout ) 
      arr_check = []
      arr.each_with_index do |element, index|
        if (index) % (board + 1) == 0
          arr_check << element         
          if arr_check.count == board       
            arr_check.all? {|x| x == simbol} ? checkout.clear : false        
          end    
        end
      end
    #return "#{name} WON!"
    end


    def check_cross_left(arr, board, name, simbol, checkout )
      arr_check = []
      arr.each_with_index do |element, index|
        if (index) % (board-1) == 0 and index != 0 and index != ((board**2)-1)         
          arr_check << element         
          if arr_check.count == board       
            arr_check.all? {|x| x == simbol} ? checkout.clear : false                    
          end  
          end
      end
    #return "#{name} WON!"
    end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
