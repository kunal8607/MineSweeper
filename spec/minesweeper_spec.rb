# spec/string_calculator_spec.rb
require_relative '../lib/minesweeper'
describe Minesweeper do
  subject { Minesweeper.new(10, 12, 9) }

  it 'should raise exception if provided height and width can not accumulate provided mines' do
    expect { Minesweeper.new(2, 2, 9) }.to raise_error(ArgumentError)
  end

  it 'should have a board containing provided mines count' do
    count = 0
    subject.board.each do |i|
      count += i.count('X')
    end

    expect(count).to eql(9)
  end

  it 'should have recieved fill mines in board method to fill all the provided mines' do
    minesweeper = Minesweeper.allocate
    expect(minesweeper).to receive(:fill_mines_in_board).with(9)
    minesweeper.send(:initialize, 2, 12, 9)
  end

  it 'should be valid of type array with provided height and width' do
    expect(subject.board.is_a?(Array)).to eql(true)
    expect(subject.board.size).to eql(10)
    expect(subject.board.first.size).to eql(12)
  end

  describe 'Board' do
    before do
      subject.board = [[0, 0, 'X', 0], [0, 0, 0, 0], [0, 'X', 'X', 0]]
    end

    describe '#valid_coordinates?' do
      it 'should return false in case of invalid corrdinates' do
        expect(subject.send(:valid_coordinates?, -1, 6)).to eql(false)
        expect(subject.send(:valid_coordinates?, 1, 6)).to eql(false)
      end

      it 'should return true in case of valid corrdinates' do
        expect(subject.send(:valid_coordinates?, 1, 2)).to eql(true)
        expect(subject.send(:valid_coordinates?, 2, 2)).to eql(true)
      end
    end

    describe '#calculate_board' do
      it "should update the 0's in board to a digit based on the number of adject mines " do
        subject.calculate_board
        expect(subject.board[0][1]).to eql(1)
        expect(subject.board[1][2]).to eql(2)
        expect(subject.board[2][0]).to eql(1)
        expect(subject.board[2][3]).to eql(1)
      end
    end

    describe '#get_surrounding_vals' do
      it 'should return the surroundings elements of a element in board' do
        expect(subject.send(:get_surrounding_vals, 0, 0)).to eql([nil, 0, nil, 0])
        expect(subject.send(:get_surrounding_vals, 0, 1)).to eql([nil, 0, 0, 'X'])
        expect(subject.send(:get_surrounding_vals, 1, 1)).to eql([0, 'X', 0, 0])
        expect(subject.send(:get_surrounding_vals, 2, 1)).to eql([0, nil, 0, 'X'])
      end
    end

    describe '#get_count' do
      it 'should return count of adject mines of a 0 in board' do
        expect(subject.send(:get_count, 0, 0)).to eql(0)
        expect(subject.send(:get_count, 0, 1)).to eql(1)
        expect(subject.send(:get_count, 1, 0)).to eql(0)
        expect(subject.send(:get_count, 1, 2)).to eql(2)
        expect(subject.send(:get_count, 2, 0)).to eql(1)
      end
    end
  end
end
