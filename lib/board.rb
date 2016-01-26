require_relative 'piece'

class Board
  attr_reader :spaces

  def initialize
    @spaces = build_board
  end

  def build_board
    empty = [[],[],[]]
    0.upto(8) do |i|
      case
      when i <= 2 then empty[0] << Piece.new(i)
      when i <= 5 then empty[1] << Piece.new(i)
      when i <= 8 then empty[2] << Piece.new(i)
      end
    end
    empty
  end

  def assign_piece(positions, value)        # assume positions == [x,y] position
    if positions.any? {|num| num < 0 || num > 3 }
      raise ArgumentError, "Given positions are out of range. 0 <= position <= 2."
    end
    @spaces[positions.first][positions.last].value = value
  end

  def available_spaces
    @spaces.flatten.map {|p| p.position if p.value.empty? }.compact
  end
end
