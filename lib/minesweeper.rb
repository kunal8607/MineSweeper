#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'show_board' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER height
#  2. INTEGER widthArray.new(x) {Array.new(y,0)}
#  3. INTEGER num_mines
#


#------ CLASS BEGIN ----
class Minesweeper
    attr_accessor :board
    def initialize(rows, cols, mines)
        # arr = Array.new(cols, 0)
        @board= Array.new(rows) do |i|
            i = Array.new(cols, 0)
        end
        num_inserts = 0
        while num_inserts < mines do
            ran_row = rand(rows)
            ran_col = rand(cols)
            
            if @board[ran_row][ran_col] == 0
                @board[ran_row][ran_col] = "X"
                num_inserts = num_inserts + 1           
            end   
        end   
    end
    
    def print_board_preety
        @board.each do |row|
           row.each do |col|
            print col
           end
        puts 
        end
    end
    
    def calculate_board
     @board.each_with_index do |row_val, row|
        row_val.each_with_index do |col_val,col|
            if col_val == 0
                count = get_count(row,col)
                if count > 0
                   @board[row][col] = count
                end    
            end
        end
     end
    end
    
    
    def get_count(row, col)
       get_surrounding_vals(row, col).count("X")
    end
    
    def get_surrounding_vals(x,y) #(2,2)
        up = (valid_coodinates(x-1,y)) ? @board[x-1][y] : nil  
        down = (valid_coodinates(x+1,y)) ? @board[x+1][y] : nil  
        right =  (valid_coodinates(x,y+1)) ? @board[x][y+1] : nil  
        left =  (valid_coodinates(x,y-1)) ? @board[x][y-1] : nil

        return [up,down,left, right]
    end
    
    def valid_coodinates(x,y)
        x.between?(0, @board.size-1) && y.between?(0, @board[x].size-1)
    end
    
end
    
#----- CLASS END


def show_board(height, width, num_mines)
   mineboard = Minesweeper.new(height,width,num_mines)
   puts "Board before processing"
   mineboard.print_board_preety
   mineboard.calculate_board
   puts "Board after processing"
   mineboard.print_board_preety
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

height = 4

width = 4

num_mines = 3

result = show_board height, width, num_mines

fptr.write result
fptr.write "\n"

fptr.close()