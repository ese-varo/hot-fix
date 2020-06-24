require_relative '../board'
RSpec.describe "Game" do
  describe "#read" do
    game = Game.new
    it 'validate existence of a cell inside board' do
      expect(game.inside_board?(-1, 0)).to eq(false)
      expect(game.inside_board?(0, -1)).to eq(false)
      expect(game.inside_board?(2, 2)).to eq(true)
      expect(game.inside_board?(1, 2)).to eq(true)
      expect(game.inside_board?(0, 0)).to eq(true)
    end

    it 'validate alive neighbours' do
      expect(game.neighbours(0, 0)).to eq(2)
      expect(game.neighbours(0, 1)).to eq(3)
      expect(game.neighbours(0, 2)).to eq(3)
      expect(game.neighbours(1, 0)).to eq(4)
      expect(game.neighbours(1, 1)).to eq(5)
      expect(game.neighbours(1, 2)).to eq(4)
      expect(game.neighbours(2, 0)).to eq(2)
      expect(game.neighbours(2, 1)).to eq(3)
      expect(game.neighbours(2, 2)).to eq(3)
    end

    it "Tells you if the cell is death" do
      next_stage = [[1,1,1],
                    [0,0,0],
                    [0,1,1]]
      expect(game.read).to eq(next_stage)
    end
  end
end
