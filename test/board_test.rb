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
end
