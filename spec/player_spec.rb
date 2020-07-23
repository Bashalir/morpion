# frozen_string_literal: true

require 'player'
require 'game'
require 'board'
require 'board_case'

describe 'Player' do
  before do
    @player1 = Player.new('player1', 'X')
    @player2 = Player.new('player2', 'O')
    @board = Board.new
  end

  it'player1 select the first board case "A1"' do
    @player1.select_a_board_case(@board, 'A', 1)
    check_board_cases(@player1, 1, 'A', 1)
  end

  it 'player2 select the middle board case "B2"' do
    @player2.select_a_board_case(@board, 'B', 2)
    check_board_cases(@player2, 5, 'B', 2)
  end

  it 'player2 select the last board case "C3"' do
    @player2.select_a_board_case(@board, 'C', 3)
    check_board_cases(@player2, 9, 'C', 3)
  end

  def check_board_cases(player, index, row, column)
    expect(@board.board_cases[index - 1].index).to eq(index)
    expect(@board.board_cases[index - 1].row).to eq(row)
    expect(@board.board_cases[index - 1].column).to eq(column)
    expect(@board.board_cases[index - 1].player).to be player
  end
end
