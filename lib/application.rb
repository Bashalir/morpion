# frozen_string_literal: true

class Application
  attr_accessor :game, :show

  def initialize
    @show = Show.new
  end

  def start_game
    @show.presentation
    players = @show.players_inscription
    player1 = Player.new(players[0], 'X')
    player2 = Player.new(players[1], 'O')
    @game = Game.new([player1, player2])
    launch_game
  end

  def launch_game
    @game.board = Board.new
    loop do
      turn = 1
      @game.players.each do |player|
        choice = false

        while choice == false
          @show.all_board(@game.board)
          p player.name
          choice = @show.choose_board_case(player.name, turn)
        end
        p choice
        player.select_a_board_case(@game.board, choice[0], choice[1])
        system 'clear'
      end
      turn += 1
    end
  end
end
