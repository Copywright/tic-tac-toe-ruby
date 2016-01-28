require 'colorize'

class Display
  attr_reader :board

  def self.welcome_banner
    puts "  __  .__           __                    __
_/  |_|__| ____   _/  |______    ____   _/  |_  ____   ____
\   __\  |/ ___\  \   __\__  \ _/ ___\  \   __\/  _ \_/ __ \
 |  | |  \  \___   |  |  / __ \\  \___   |  | (  <_> )  ___/
 |__| |__|\___  >  |__| (____  /\___  >  |__|  \____/ \___  >
              \/             \/     \/                    \/
".red.on_white.blink
  end

  def self.choose_piece
    puts "Would you like to be 'X' or 'O'?\n\n".yellow.on_white
  end

  def self.you_are(choice)
    puts "You are '#{choice.red}'.\n\n".green
  end

  def self.invalid_choice
    puts "Oops! Sorry, that wasn't a valid response. Try again! \n\n".red.on_white
  end

  def self.choose_row
    puts "Which row would you like to place in? (1-3)\n\n".yellow.on_white
  end

  def self.choose_column
    puts "Which column would you like to place in? (1-3)\n\n".yellow.on_white
  end


  def self.play_again
    puts "Would you like to play again?\n\n"
  end

  def self.game_has_begun
    puts " ___   ___         ___         ___   ___   ___   ___   ___
    |     |   | |\ /| |           |       |   |   | |   |   |
    | +-  |-+-| | + | |-+-         -+-    +   |-+-| |-+-    +
    |   | |   | |   | |               |   |   |   | |  \    |
    ---               ---         ---
    ".green.on_white.blink
  end

  def self.winner
    puts "'||' '|'  ..|''||   '||'  '|'    '|| '||'  '|' '||' '|.   '|'
  || |   .|'    ||   ||    |      '|. '|.  .'   ||   |'|   |
   ||    ||      ||  ||    |       ||  ||  |    ||   | '|. |
   ||    '|.     ||  ||    |        ||| |||     ||   |   |||
  .||.    ''|...|'    '|..'          |   |     .||. .|.   '|

                                                              \n\n\n".green.on_white.blink
  end

  def self.loser
    puts "
_/      _/    _/_/    _/    _/      _/          _/_/      _/_/_/  _/_/_/_/
 _/  _/    _/    _/  _/    _/      _/        _/    _/  _/        _/
  _/      _/    _/  _/    _/      _/        _/    _/    _/_/    _/_/_/
 _/      _/    _/  _/    _/      _/        _/    _/        _/  _/
_/        _/_/      _/_/        _/_/_/_/    _/_/    _/_/_/    _/_/_/_/
                                                                             \n\n\n".red.on_white.blink
  end

  def initialize(board = empty_board)
    @board = set_board(board)
  end

  def insert_piece(position, value, board = @board)
    case position
    when 0 then board[102] = value
    when 1 then board[116] = value
    when 2 then board[130] = value
    when 3 then board[439] = value
    when 4 then board[452] = value
    when 5 then board[466] = value
    when 6 then board[734] = value
    when 7 then board[747] = value
    when 8 then board[761] = value
    end
  end

  private

  def set_board(board)
    board.class == Board ? build_board(board) : empty_board
  end

  def build_board(board)
    new_board = empty_board
    pieces    = board.spaces.flatten
    pieces.each do |p|
      insert_piece(p.position, p.value, new_board) unless p.value.empty?
    end
    new_board
  end

  def empty_board
    "
                          |            |
                          |            |
                          |            |                                 *
                          |            |
                          |            |
             _____________|____________|_______________
                          |            |
                          |            |
                          |            |
                          |            |                                 *
                          |            |
                          |            |
             _____________|____________|_______________
                          |            |
                          |            |
                          |            |                                 *
                          |            |
                          |            |"
  end

end
