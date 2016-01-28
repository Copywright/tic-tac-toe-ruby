class GameManager
  attr_reader :player_piece, :enemy

  def initialize
    @enemy = Enemy.new
    @board = Board.new
  end

  def start
    Display.welcome
    @player_piece = Input.player_choice
    Display.game_has_begun(player_piece)
    game_loop
  end

  private

  def game_loop
    show_board
    choose_spot
    board.winner ? game_over : next_turn
  end

  def next_turn
    @enemy.play(board)
    Input.player_prompt
  end

  def show_board
    puts board.to_display
  end

  def choose_spot
    row = Input.choose_row
    col = Input.choose_column
    board.assign_piece([row, col], player_piece)
  end

  def game_over
    board.winner == player_piece ? Display.winner : Display.loser
    Input.play_again? ? restart : Display.end_game
  end

  def restart
    @board = Board.new
    start
  end
end
