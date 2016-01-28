require_relative 'display'

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

  def self.choose_spot
    loop do
      Display.choose_row
      row = get_input
      set_choice(row)
    end
  end

  def self.choose_column
    loop do
      Display.choose_column
      col = get_input
      set_choice(col)
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
    if [1, 2, 3].include?(choice)
      return choice - 1
    else
      Display.invalid_choice
    end
  end
end
