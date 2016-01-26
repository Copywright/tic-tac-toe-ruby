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
end
