# frozen_string_literal: true

require 'application'
require 'game'
require 'show'
require 'board'
require 'board_case'
require 'player'

describe 'Application' do
  before do
    @application = Application.new
    @show = @application.show

    @player1 = Player.new('player1', 'X')
    @player2 = Player.new('player2', 'O')
    @game = @application.game = Game.new([@player1, @player2])
    @board = @game.board = Board.new
  end

  skip 'check winner' do
    @player1.select_a_board_case(@game.board, 'A', 1)
    @player1.select_a_board_case(@game.board, 'B', 2)
    @player1.select_a_board_case(@game.board, 'C', 3)
    @player2.select_a_board_case(@game.board, 'B', 1)
    @application.check_winner(4)
  end
end
