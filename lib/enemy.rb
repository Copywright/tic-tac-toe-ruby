class Enemy
  attr_reader :difficulty, :board, :piece

  def initialize(difficulty: :easy, piece:)
    @piece = piece
    @difficulty = :easy
  end

  def play(board)
    @board = board
    case difficulty
    when :easy then play_randomly
    end
  end

  private

  def place_piece(place)
    case
    when place <= 2 then board.assign_piece([0, place], @piece)
    when place <= 5 then board.assign_piece([1, place - 3], @piece)
    when place <= 8 then board.assign_piece([2, place - 6], @piece)
    end
  end

  def play_randomly
    place = board.available_spaces.sample
    place_piece(place)
  end
end
