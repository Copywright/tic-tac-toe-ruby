class Piece
  attr_reader :position
  attr_accessor :value

  def initialize(pos)
    @value = ""
    @position = pos
  end
end
