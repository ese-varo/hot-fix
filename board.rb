require_relative 'cell'
class Game

  attr_reader :size, :board
  def initialize
    @size = 3
    @board = [[1,1,0],
              [0,1,1],
              [0,1,1]]
  end

  def read
    temp_board = create
    puts
    (0..2).each do |row|
      (0..2).each do |column|
        cell = board[row][column]
        status = Cell.new.alive?(cell)
        alive_neighbours = neighbours(row,column)
        print "[#{row}, #{column}] = #{alive_neighbours}, "
        if status && alive_neighbours >=4
          temp_board[row][column] = 0
        elsif status && alive_neighbours >=2
          temp_board[row][column] = 1
        elsif status && alive_neighbours <=1
          temp_board[row][column] = 0
        elsif status == false && alive_neighbours == 3
          temp_board[row][column] = 1
        end
      end
      puts
    end
    temp_board
  end

  def print_board
    # Esto nos ayuda para hacer la matrix en cuadrito
    board.to_a.each {|r| puts r.inspect}
  end

  def neighbours(row, column)
    neighbours = []
    neighbours << board[row-1][column]   if inside_board?(row-1, column)
    neighbours << board[row-1][column+1] if inside_board?(row-1, column+1)
    neighbours << board[row-1][column-1] if inside_board?(row-1, column-1)
    neighbours << board[row+1][column+1] if inside_board?(row+1, column+1)
    neighbours << board[row+1][column]   if inside_board?(row+1, column)
    neighbours << board[row+1][column-1] if inside_board?(row+1, column-1)
    neighbours << board[row][column-1]   if inside_board?(row, column-1)
    neighbours << board[row][column+1]   if inside_board?(row, column+1)
    neighbours.count(1)
  end

  private

  def inside_board?(row, column)
    row < size && row >= 0 && column < size && column >= 0
  end

  def create
    new_board = []
    size.times do |row|
      new_board << []
      size.times { |column| new_board[row][column] = 0 }
    end
    new_board
  end
end

game = Game.new
print game.board
puts
puts
game.read
# puts
# print game.board
# puts game.neighbours(1, 1)
# puts game.neighbours(0, 0)

