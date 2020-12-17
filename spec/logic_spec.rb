require_relative '../lib/board'
require_relative '../lib/logic'

describe Board do
  describe 'board_game:' do
    it 'creates de board when an array is given' do
      board = Board.new
      expect(board.board_game([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eql("\n    | 1 | 2 | 3 |\n    -------------\n    | 4 | 5 | 6 |\n    -------------\n    | 7 | 8 | 9 |\n\n")
    end
    it 'creates and empty board witouth items when the array is empty' do
      board = Board.new
      expect(board.board_game([])).to eql("\n    |  |  |  |\n    -------------\n    |  |  |  |\n    -------------\n    |  |  |  |\n\n")
    end
  end
end

describe ChangeNumbers do
  describe 'number_change:' do
    let(:changee) { ChangeNumbers.new }
    let(:arrayt) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    let(:number) { 2 }
    let(:number20) { 20 }
    let(:simbol) { 'X' }

    it 'change an element from the array with a symbol' do
      expect(changee.number_change(number, arrayt, simbol)).to eql([1, 'X', 3, 4, 5, 6, 7, 8, 9])
    end

    it 'will not change anything on the board if the element is not in the array' do
      expect(changee.number_change(number20, arrayt, simbol)).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end

describe Analize do
  describe 'conditions:' do
    let(:change) { Analize.new }
    let(:array) { ['X', 'O', 'X', 4, 5, 6, 7, 8, 9] }
    let(:array2) { ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] }
    let(:array4) { ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] }
    let(:array5) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    let(:array3) { %w[X O X X O X O X O] }
    let(:player) { 'Juan' }
    let(:sim) { 'X' }
    let(:checkout) { [1] }

    it 'prints the winner if its in the first row' do
      expect(change.conditions(array4, player, sim, checkout)).to eql('>>Juan WINS<<')
    end

    it "doesn't display a win or draw message" do
      expect(change.conditions(array, player, sim, checkout)).to eql(nil)
    end

    it 'displays the winner if its a win in the first column ' do
      expect(change.conditions(array2, player, sim, checkout)).to eql('>>Juan WINS<<')
    end

    it 'displays a draw' do
      expect(change.conditions(array3, player, sim, checkout)).to eql(">>IT'S A DRAW<<")
    end

    it 'displays nil if no movement is made' do
      expect(change.conditions(array5, player, sim, checkout)).to eql(nil)
    end
  end
end
