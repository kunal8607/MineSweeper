require_relative 'lib/minesweeper'
puts '++++++++++++++++++++++++++++'
puts 'WELCOME TO MINESWEEPER GAME'
puts '++++++++++++++++++++++++++++'
puts 'provide value height of board'

height = gets.chomp.to_i

puts 'provide value width of board'

width = gets.chomp.to_i

puts 'provide munber of mines to want to put in board'

num_mines = gets.chomp.to_i

board = Minesweeper.new(height, width, num_mines)
puts 'Board before processing'
board.print_board_preety
board.calculate_board
puts 'Board after processing'
board.print_board_preety
