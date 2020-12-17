require_relative '../lib/board'
require_relative '../lib/logic'

describe ChangeNumbers do
  describe 'number_change:' do
    it 'change an element from the array with a symbol' do
      change = ChangeNumbers.new
      expect(change.number_change(2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 'X')).to eql([1, 'X', 3, 4, 5, 6, 7, 8, 9])
    end
  end
end

describe Analize do
  describe 'conditions:' do
    let(:change) { Analize.new }
    let(:array) { ['X', 'O', 'X', 4, 5, 6, 7, 8, 9] }
    let(:array2) { ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] }
    let(:array3) { %w[X O X X O X O X O] }
    let(:player) { 'Juan' }
    let(:sim) { 'X' }
    let(:checkout) { [1] }

    it 'prints the winner the if it is a win in a row' do
      expect(change.conditions(array, player, sim, checkout)).to eql(nil)
    end

    it 'prints the winner if it is a win in a column ' do
      expect(change.conditions(array2, player, sim, checkout)).to eql('Juan WINS')
    end

    it 'tells the players its a draw' do
      expect(change.conditions(array3, player, sim, checkout)).to eql("IT'S A DRAW")
    end
  end
end
