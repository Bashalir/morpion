# frozen_string_literal: true

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def select_a_board_case(board, row, column)
    index_of_selected_board_case = board.board_cases.find_index do |board_case|
      board_case.row == row && board_case.column == column
    end
    board.board_cases[index_of_selected_board_case].player = self
  end
end
