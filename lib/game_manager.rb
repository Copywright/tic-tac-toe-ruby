require 'colorize'
require_relative 'board'
require_relative 'enemy'
require_relative 'input'
require_relative 'display'

class GameManager
  attr_reader :player_piece, :enemy, :board

  def initialize
    @board = Board.new
  end

  def start
    Display.welcome_banner
    @player_piece = Input.player_choice
    set_enemy
    Display.game_has_begun
    game_loop
  end

  private

  def set_enemy
    if @player_piece == "X"
      @enemy = Enemy.new(piece: "O")
    else
      @enemy = Enemy.new(piece: "X")
    end
  end

  def game_loop
    loop do
      show_board
      choose_spot
      if board.winner
        game_over
        break
      else
        @enemy.play(board)
      end
    end
  end

  def show_board
    system "clear" or system "cls"
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
