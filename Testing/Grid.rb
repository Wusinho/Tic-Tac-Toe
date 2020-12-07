class Grid
    @@new_grid = []
  
    def initialize(grid)
        @grid = grid.to_i    
    end


    def create_grid
        grid_layout = @grid **2
        arr = (0...grid_layout).to_a
        @@new_grid = []
        
        until arr == []
          @@new_grid += [arr[0..@grid-1]]
            arr.shift(@grid)
        end   
       @@new_grid  
    end
       
    

    def change_element(item = "-1")
      @@x_arr = @@new_grid.flatten

      @@x_arr.collect! { |element|
        (element == item) ? "X" : element
      }
      print @@x_arr
    end   


    

    def print_table(margin_width = 2)
    
      column_widths = []
      @@new_grid.each do |row|
        row.each.with_index do |cell, column_num|
          column_widths[column_num] = [column_widths[column_num] || 0, cell.to_s.size].max
        end
      end
    
      puts (@@new_grid.collect do |row|
        row.collect.with_index do |cell, column_num|
          cell.to_s.ljust(column_widths[column_num] + margin_width)
        end.join
      end)
    end
        

          




           


end




#grilla = Grid.new(3)
#grilla.create_grid
#grilla.print_table

