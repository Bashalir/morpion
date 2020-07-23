# frozen_string_literal: true

require 'game'
require 'player'
require 'board'
require 'board_case'

describe 'Game' do
  before do
    @game = Game.new
    @game.board = Board.new
    @player1 = Player.new('player1', 'X')
    @player2 = Player.new('player2', 'O')
    @game.players = [@player1, @player2]
  end

  it'Create a game with 2 players' do
    expect(@game.players[0].name).to eq('player1')
  end

  it'Create a board' do
    expect(@game.board).to be_an_instance_of(Board)
  end

  it 'should return PLayer1 if player1 selectd A1 B2 C3' do
    @player1.select_a_board_case(@game.board, 'A', 1)
    @player1.select_a_board_case(@game.board, 'B', 2)
    @player1.select_a_board_case(@game.board, 'C', 3)
    @player2.select_a_board_case(@game.board, 'B', 1)
    expect(@game.check_board).to be @player1
  end

  it 'should return PLayer2 if player2 selectd A3 B2 C1' do
    @player2.select_a_board_case(@game.board, 'A', 3)
    @player2.select_a_board_case(@game.board, 'B', 2)
    @player2.select_a_board_case(@game.board, 'C', 1)
    @player1.select_a_board_case(@game.board, 'B', 1)
    expect(@game.check_board).to be @player2
  end

  it 'Should return Player1 if Player1 selected A1 A2 A3' do
    @player1.select_a_board_case(@game.board, 'A', 1)
    @player1.select_a_board_case(@game.board, 'A', 2)
    @player1.select_a_board_case(@game.board, 'A', 3)
    @player2.select_a_board_case(@game.board, 'B', 1)
    expect(@game.check_board).to be @player1
  end
  it 'Should return Player1 if Player1 selected A1 A2 A3' do
    @player1.select_a_board_case(@game.board, 'A', 1)
    @player1.select_a_board_case(@game.board, 'B', 1)
    @player1.select_a_board_case(@game.board, 'C', 1)
    @player2.select_a_board_case(@game.board, 'B', 2)
    expect(@game.check_board).to be @player1
  end

  it 'Should return Player2 if Player2 selected B1 B2 B3' do
    @player2.select_a_board_case(@game.board, 'B', 1)
    @player2.select_a_board_case(@game.board, 'B', 2)
    @player2.select_a_board_case(@game.board, 'B', 3)
    @player1.select_a_board_case(@game.board, 'C', 1)
    expect(@game.check_board).to be @player2
  end

  it 'Should return Player2 if Player2 selected A1 B1 C3' do
    @player2.select_a_board_case(@game.board, 'A', 1)
    @player2.select_a_board_case(@game.board, 'B', 2)
    @player2.select_a_board_case(@game.board, 'C', 3)
    @player1.select_a_board_case(@game.board, 'C', 1)
    expect(@game.check_board).to be @player2
  end
end
