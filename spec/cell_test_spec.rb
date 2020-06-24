require './cell'

RSpec.describe "Cell" do
  describe "#alive?" do
    it "tells you if your cell is alive" do
      cell = Cell.new
      alive = cell.alive?(1)
      expect(alive).to eq(true)
    end
  end
end
