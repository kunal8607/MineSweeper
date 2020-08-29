# spec/string_calculator_spec.rb
require_relative '../lib/minesweeper'
describe Minesweeper do
  subject { Minesweeper.new(10, 12, 9) }

  it 'should raise exception if provided height and width can not accumulate provided mines' do
    expect { Minesweeper.new(2, 2, 9) }.to raise_error(ArgumentError)
  end

  it 'should have the provided mines count' do
    count = 0
    subject.board.each do |i|
      count += i.count('X')
    end

    expect(count).to eql(9)
  end

  it 'should have recieved fill mines in board to fill all the provided mines' do
    minesweeper = Minesweeper.allocate
    expect(minesweeper).to receive(:fill_mines_in_board).with(9)
    minesweeper.send(:initialize, 2, 12, 9)
  end

  it 'should be valid of type array with provided height and width' do
    p subject.class
    expect(subject.board.is_a?(Array)).to eql(true)
    expect(subject.board.size).to eql(10)
    expect(subject.board.first.size).to eql(12)
  end

  describe '.check_coordinates' do
    it 'should return true or false for a given coordinates' do
    end
  end
end
