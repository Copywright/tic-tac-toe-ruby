require_relative 'display'
require 'pry'

class Input
  def self.player_choice
    loop do
      Display.choose_piece
      choice = get_input.upcase
      if choice == "O" || choice == "X"
        Display.you_are(choice)
        return choice
      else
        Display.invalid_choice
      end
    end
  end

  def self.choose_row
    loop do
      Display.choose_row
      row = get_input
      return set_choice(row) if set_choice(row)
    end
  end

  def self.choose_column
    loop do
      Display.choose_column
      col = get_input
      return set_choice(col) if set_choice(col)
    end
  end

  def self.play_again?
    loop do
      Display.play_again
      choice = get_input
      case choice.upcase
      when "Y" then return true
      when "N" then return false
      else
        Display.invalid_choice
      end
    end
  end

  private

  def self.get_input
    print "?> "
    gets.strip
  end

  def self.set_choice(choice)
    input = choice.to_i
    if [1, 2, 3].include?(input)
      return input - 1
    else
      Display.invalid_choice
    end
  end
end
