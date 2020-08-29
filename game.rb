require_relative 'lib/minesweeper'
puts '++++++++++++++++++++++++++++'
puts 'WELCOME TO MINESWEEPER GAME'
puts '++++++++++++++++++++++++++++'

print 'provide value height of board: '
height = gets.chomp.to_i
print "\n"
print  'provide value width of board: '
width = gets.chomp.to_i
print "\n"
print  'provide munber of mines to want to put in board: '
num_mines = gets.chomp.to_i
print "\n"
board = Minesweeper.new(height, width, num_mines)
puts 'Board before processing'
board.print_board_preety

puts "==========================================="
board.calculate_board
puts 'Board after processing'
board.print_board_preety