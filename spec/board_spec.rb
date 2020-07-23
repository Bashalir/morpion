# frozen_string_literal: true

require 'game'
require 'player'
require 'board'
require 'board_case'

describe 'Board' do
  before do
    @game = Game.new
    @player1 = Player.new('player1', 'X')
    @player2 = Player.new('player2', 'O')
    @board = Board.new
  end

  it'Create a board with 9 case' do
    expect(@board.board_cases).to be_a(Array)
    expect(@board.board_cases.length).to eq(9)
    expect(@board.board_cases[0]).to be_an_instance_of(BoardCase)
  end

  it'the first board case with index 1 "A" Row "1" Column and "false" Player' do
    expect(@board.board_cases[0].index).to eq(1)
    expect(@board.board_cases[0].row).to eq('A')
    expect(@board.board_cases[0].column).to eq(1)
    expect(@board.board_cases[0].player).to be false
  end

  it'the middle board case is "B" row and "2" column with no player ' do
    expect(@board.board_cases[4].index).to eq(5)
    expect(@board.board_cases[4].row).to eq('B')
    expect(@board.board_cases[4].column).to eq(2)
    expect(@board.board_cases[4].player).to be false
  end

  it'the last board case is "C" row and "3" column with no player ' do
    expect(@board.board_cases[8].index).to eq(9)
    expect(@board.board_cases[8].row).to eq('C')
    expect(@board.board_cases[8].column).to eq(3)
    expect(@board.board_cases[8].player).to be false
  end

  it 'Should get_symbol return"X" if the player1 choose "A1"' do
    @player1.select_a_board_case(@board, 'A', 1)
    expect(@board.get_symbol(0)).to eq('X')
  end
  it 'Should get_symbol return"O" if the player2 choose "B2"' do
    @player2.select_a_board_case(@board, 'B', 2)
    expect(@board.get_symbol(4)).to eq('O')
  end
end
