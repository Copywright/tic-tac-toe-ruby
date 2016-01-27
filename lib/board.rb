require 'pry'
require_relative 'piece'
require_relative 'display'

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
    spaces[positions.first][positions.last].value = value
  end

  def available_spaces
    spaces.flatten.map {|p| p.position if p.value.empty? }.compact
  end

  def to_display
    Display.new(self).board
  end

  def winner
    check_rows || check_columns || check_diagonal
  end

  private

  def check_rows
    values = spaces.map {|row| row.map(&:value) }
    match  = values.select {|row| row.uniq.size == 1 && !row.uniq.first.empty? }
    match.empty? ? nil : match.flatten.uniq.first
  end

  def check_columns
    first_row, second_row, third_row, match = [spaces, ("")].flatten

    3.times do |i|
      column = [first_row[i].value, second_row[i].value, third_row[i].value].uniq
       match = first_row[i].value if column.length == 1
    end

    nil if match.empty?
  end

  def check_diagonal
    middle_filled = !spaces[1][1].value.empty?
    return unless middle_filled

    middle_value  = spaces[1][1].value
    match = diagonal_match?(middle_value)
    match ? middle_value : nil
  end

  def diagonal_match?(center)
    corners = [0, 4, 6, 8]
    matches = []

    corners.any? do |i|
      matches << i if spaces.flatten[i].value == center
      true if matches & [0, 8] == [0, 8] || matches & [2, 6] == [2, 6]
    end
  end
end
