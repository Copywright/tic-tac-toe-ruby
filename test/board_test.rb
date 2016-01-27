require_relative 'test_helper'
require_relative '../lib/board.rb'
require 'pry'

class BoardTest < MiniTest::Test

  describe "initialize" do
    def setup
      @board = Board.new
    end

    it "should start with 3x3 grid of Piece objects" do
      pieces = @board.spaces.flatten
      pieces.each {|piece| assert_kind_of Piece, piece }
    end

    it "should have pieces correspond w/ spot in array" do
      pieces = @board.spaces.flatten
      pieces.each_with_index {|piece, i| assert_equal i, piece.position }
    end
  end

  describe "assign_piece" do
    def setup
      @board = Board.new
    end

    it "should assign the piece in the correct position on the board" do
      positions = [0,2]     # last place in first row
      @board.assign_piece(positions, "X")

      assert_equal "X", @board.spaces[positions.first][positions.last].value

      positions = [1,1]     # middle place in middle row
      @board.assign_piece(positions, "O")

      assert_equal "O", @board.spaces[positions.first][positions.last].value
    end

    it "should raise exception when positions are out of range" do
      positions = [5, 10]
      assert_raises(ArgumentError) { @board.assign_piece(positions, "O") }
    end
  end

  describe "available_spaces" do
    def setup
      @board = Board.new
    end

    it "should return array of available positions" do
      3.times do |i|
        positions = [0, i]
        @board.assign_piece(positions, "O")
      end

      binding.pry

      assert_equal false, @board.available_spaces.any? {|i| i <= 2 }  # 0, 1, 2 (first row) filled.
    end
  end
end
