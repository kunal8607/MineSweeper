class Minesweeper
  attr_accessor :board
  def initialize(rows, cols, mines)
    @board = Array.new(rows) do |_i|
      Array.new(cols, 0)
    end
    unless self.class.validate_inputs?(rows, cols, mines)
      raise ArgumentError, 'privided height and width can not accumulate the given mines'
    end
    fill_mines_in_board(mines)
  end

  def fill_mines_in_board(number_of_mines)
    num_inserts = 0
    while num_inserts < number_of_mines
      ran_row = rand(@board.size)
      ran_col = rand(@board.first.size)
      if @board[ran_row][ran_col] == 0
        @board[ran_row][ran_col] = 'X'
        num_inserts += 1
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
      row_val.each_with_index do |col_val, col|
        next unless col_val == 0
        count = get_count(row, col)
        @board[row][col] = count if count > 0
      end
    end
  end

  private

  def get_surrounding_vals(x, y)
    up = valid_coordinates?(x - 1, y) ? @board[x - 1][y] : nil
    down = valid_coordinates?(x + 1, y) ? @board[x + 1][y] : nil
    right = valid_coordinates?(x, y + 1) ? @board[x][y + 1] : nil
    left = valid_coordinates?(x, y - 1) ? @board[x][y - 1] : nil
    [up, down, left, right]
  end

  def valid_coordinates?(x, y)
    x.between?(0, @board.size - 1) && y.between?(0, @board[x].size - 1)
  end

  def self.validate_inputs?(rows, cols, mines)
    rows * cols >= mines
  end

  def get_count(row, col)
    get_surrounding_vals(row, col).count('X')
  end
end
